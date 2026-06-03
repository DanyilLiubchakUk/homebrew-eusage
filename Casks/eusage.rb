cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.24"
  sha256 arm:   "428cc29506def1f055b5e5b35b77e313531a449f5d0ab60e19ed4ab6a776506e",
         intel: "d90ff2bc9e86f63b08cae5f66b54224129ad63d1fbf5a63888a9abd3b9a2a6b3"

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
