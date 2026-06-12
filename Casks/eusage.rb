cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.29"
  sha256 arm:   "e7f4b5a068da587e8c06bdb7dda79ad72dc467f20eb7fa0c9fb6643942a33d5a",
         intel: "756a20de1770e89275c026eb07590dfdf70f631301bfdf15d8c396a088f05d49"

  url "https://github.com/DanyilLiubchakUk/eusage/releases/download/v#{version}/eUsage_#{version}_#{arch}.dmg"
  name "eUsage"
  desc "Internal team AI usage tracker"
  homepage "https://github.com/DanyilLiubchakUk/eusage"

  depends_on macos: :ventura

  app "eUsage.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/eUsage.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/app.eusage.desktop",
    "~/Library/Logs/app.eusage.desktop",
    "~/Library/Preferences/app.eusage.desktop.plist",
    "~/Library/Saved Application State/app.eusage.desktop.savedState",
  ]
end
