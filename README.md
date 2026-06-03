# eUsage Homebrew Tap

Public Homebrew tap for eUsage macOS installs.

## Install

```bash
brew tap DanyilLiubchakUk/eusage
brew install --cask eusage --no-quarantine
```

`--no-quarantine` is required for the free unsigned macOS build.

## Upgrade

The app normally updates itself through GitHub Releases and the in-app `Restart to update` button.

Use Homebrew only if reinstall or recovery is needed:

```bash
brew update
brew upgrade --cask eusage --no-quarantine
```
