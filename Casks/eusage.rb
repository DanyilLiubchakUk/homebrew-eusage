cask "eusage" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.25"
  sha256 arm:   "7f431ddc0fd62bf6c922cfa7ce1ffc1a829a92ec34675df6d93fc960706a24ec",
         intel: "13d24e3f5b8bcaab63ecd28a8367b9bd58896739d1f98a4b1cc5741bc005e7bf"

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
