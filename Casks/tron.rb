cask "tron" do
  version "0.4.4"
  sha256 "22bea9c651b7853fcc7d525348cc5a19139a6610e87179fe8715804ab4b2f648"

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
