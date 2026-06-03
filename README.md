# eUsage Homebrew Tap

Public Homebrew tap for eUsage macOS installs.

## Install

```bash
brew tap DanyilLiubchakUk/eusage
brew install --cask eusage
```

The cask clears quarantine after install because the free macOS build is unsigned.

## Upgrade

The app normally updates itself through GitHub Releases and the in-app `Restart to update` button.

Use Homebrew only if reinstall or recovery is needed:

```bash
brew update
brew upgrade --cask eusage
```

If macOS still blocks the app, run:

```bash
xattr -cr /Applications/eUsage.app
open /Applications/eUsage.app
```
