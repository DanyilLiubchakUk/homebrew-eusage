cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.26"
  sha256 arm:   "8d0ab81ec1cfa3c6484bf93ed22ae6fefe2d8a8e496082ce4963f71e416d63f1",
         intel: "c65052b0587c228da89d99024275253a0962d083f0f0d092f4205f4d216ca850"

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
