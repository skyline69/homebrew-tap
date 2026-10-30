cask "tron" do
  version "0.4.6"
  sha256 "635f2c2acdf1a4d454f6f0588b8a19cc8d8e8ad58e0d98f89d33993399fb7e08"

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
