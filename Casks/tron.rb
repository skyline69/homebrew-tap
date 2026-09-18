cask "tron" do
  version "0.4.1"
  sha256 "d4b052125e7b608482ce945332aa49ce2400a0cad5ff68b10e03ef15e65631d0"

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
