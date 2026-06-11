cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.28"
  sha256 arm:   "70755178c489ae8b36e11151913597a71e3a48a5197b4e5b93c2ab1919941127",
         intel: "49c8b10ac195d3af303dc5f082a8fdb019d562b0cb545d0fc4c85c71230c3bb6"

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
