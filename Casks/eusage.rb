cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.30"
  sha256 arm:   "045c1efc8b1ff2999fbf434344ff2e1da3c98e0899603168cc2be3336ebe6de8",
         intel: "6a64fb48b3434fcd2d5ef389c44ca27ae881b6635ecafb53d505c4fb6b14d30f"

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
