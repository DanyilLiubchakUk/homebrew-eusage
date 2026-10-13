cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.31"
  sha256 arm:   "3130b95caa7c41adcda4207052905a7b9471543f1164c7eaf83e61d270380928",
         intel: "4eabdf01969d75d48bed451d1c5d90168955a3d02855eff910983423a71f3aab"

  url "https://github.com/dliubchak/eusage/releases/download/v#{version}/eUsage_#{version}_#{arch}.dmg"
  name "eUsage"
  desc "Internal team AI usage tracker"
  homepage "https://github.com/dliubchak/eusage"

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
