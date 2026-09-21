# helgafinn/homebrew-tap

Homebrew casks and formulae for software published under
[helgafinn](https://github.com/helgafinn).

```bash
brew tap helgafinn/tap
```

Tapping is optional: the commands below include the tap name, so Homebrew adds
it automatically on first use.

## Casks

### glisse

Trackpad edge sliders for macOS brightness and volume. Glide the left edge of
the trackpad to change brightness, the right edge for volume, with the real
system HUD and haptic ticks.

```bash
brew install --cask helgafinn/tap/glisse
```

Source and documentation: [helgafinn/glisse](https://github.com/helgafinn/glisse) ·
[website](https://helgafinn.github.io/glisse/)

> [!NOTE]
> Glissé is ad-hoc signed and not notarised, so macOS blocks its first launch.
> Allow it once under **System Settings → Privacy & Security → Security → Open
> Anyway**, or run
> `xattr -dr com.apple.quarantine "/Applications/Glissé.app"`. Control-clicking
> the app and choosing Open stopped working in macOS 15. The on-screen display
> additionally needs Accessibility on macOS 26 and later; the full explanation
> is in the cask caveats and the project README.

## Formulae

### xcprune

Find unused images, colors, and localization keys in an Xcode project.

```bash
brew install helgafinn/tap/xcprune
```

Source and documentation: [helgafinn/xcprune](https://github.com/helgafinn/xcprune)

## Notes

Formulae here build from a tagged source release rather than shipping a prebuilt
binary, so installing one requires an Xcode toolchain. That keeps the tap simple
and avoids publishing bottles that would need rebuilding for every macOS and
architecture combination. Casks are different: they install a prebuilt release
artefact, so they need no toolchain.

Software in a third-party tap does not appear in the search on
[brew.sh](https://brew.sh), which indexes only Homebrew's official `homebrew/core`
and `homebrew/cask` repositories. `brew search` finds these packages once the tap
is added. Distribution through a third-party tap does not imply Homebrew
endorsement or support.
