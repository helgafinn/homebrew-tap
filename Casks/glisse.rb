cask "glisse" do
  version "1.0.0"
  sha256 "ed428cc1f8be497bee23f5a9fe7401a4ce333aaf8cf15e9dcf6c47d64cf82e32"

  url "https://github.com/helgafinn/glisse/releases/download/v#{version}/Glisse-#{version}.dmg"
  name "Glissé"
  desc "Trackpad edge sliders for brightness and volume"
  homepage "https://github.com/helgafinn/glisse/"

  # The app reads CFBundleShortVersionString, so livecheck follows the releases.
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  # The bundle name carries the accent; the executable and bundle id stay ASCII.
  app "Glissé.app"

  uninstall quit: "xyz.glisse.Glisse"

  zap trash: [
    "~/Library/Preferences/xyz.glisse.Glisse.plist",
    "~/Library/Caches/xyz.glisse.Glisse",
    "~/Library/HTTPStorages/xyz.glisse.Glisse",
  ]

  caveats do
    <<~EOS
      Glissé is ad-hoc signed and not notarised, so Gatekeeper will refuse to open
      it after a normal install. Either install without quarantine:

        brew install --cask --no-quarantine helgafinn/tap/glisse

      or clear the flag afterwards:

        xattr -d com.apple.quarantine "/Applications/Glissé.app"

      It needs Accessibility permission to see trackpad touches and drive the
      system HUD: System Settings -> Privacy & Security -> Accessibility.

      Because the signature is ad-hoc, macOS forgets that grant whenever the app
      is updated, so you will have to give it again after each upgrade.

      Verified on Apple Silicon. The Intel paths are implemented but untested.
    EOS
  end
end
