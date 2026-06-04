cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.27"
  sha256 arm:   "f1e307eab556ab93451ba2316f4704496fedff1c018b59ae17ba8007cabd72a7",
         intel: "f6f3892b0eac8f001658c232592584b1dd04749f5c58f07ba6fe2da490b2ce01"

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
