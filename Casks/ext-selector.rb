cask "ext-selector" do
  version "1.0.0"
  sha256 "255ade45c9717f617adf5d7fff4d3d815b1a683821fdbc8669d0ca2f8a93ded8"

  url "https://github.com/skyline69/ext-selector/releases/download/v#{version}/ExtSelector-#{version}.zip",
      verified: "github.com/skyline69/ext-selector/"
  name "ExtSelector"
  desc "View and change the default app that opens each file type, by category"
  homepage "https://github.com/skyline69/ext-selector"

  livecheck do
    url :url
    strategy :github_latest
  end

  # App is built against the macOS 26 SDK.
  depends_on macos: :tahoe

  app "ExtSelector.app"

  zap trash: [
    "~/Library/Preferences/com.skyline.extselector.plist",
    "~/Library/Saved Application State/com.skyline.extselector.savedState",
  ]

  caveats <<~EOS
    ExtSelector is not signed with an Apple Developer ID, so macOS Gatekeeper
    blocks the first launch. To open it, either:

      • Right-click ExtSelector.app in /Applications and choose "Open", then
        confirm in the dialog, or
      • clear the quarantine flag from a terminal:

          xattr -dr com.apple.quarantine "#{appdir}/ExtSelector.app"

    ExtSelector changes system default file handlers and is therefore not
    sandboxed.
  EOS
end
