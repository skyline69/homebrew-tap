cask "tron" do
  version "0.4.14"
  sha256 "37bddd31ada4a0ed51e6a81e35ab6c045aeb7e3cbf3c16f79b4c2a3dadcdf25c"

  url "https://github.com/skyline69/tron-terminal/releases/download/v#{version}/tron-#{version}-macos.dmg"
  name "tron"
  desc "GPU accelerated terminal emulator"
  homepage "https://github.com/skyline69/tron-terminal"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "tron.app"
  binary "#{appdir}/tron.app/Contents/MacOS/tron"

  zap trash: [
    "~/.cache/tron",
    "~/.config/tron",
    "~/.local/share/tron",
  ]

  caveats <<~EOS
    tron is not signed with an Apple Developer ID, so macOS Gatekeeper
    blocks the first launch. To open it, either:

      • Right-click tron.app in /Applications and choose "Open", then
        confirm in the dialog, or
      • clear the quarantine flag from a terminal:

          xattr -dr com.apple.quarantine "#{appdir}/tron.app"
  EOS
end
