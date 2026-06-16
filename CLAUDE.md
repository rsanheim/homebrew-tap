# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Homebrew tap containing custom formulae for rsanheim's tools. The tap is installed via `brew tap rsanheim/tap`.

## Commands

### Linting and Validation

```bash
# Check Ruby style
brew style rsanheim/tap/git-all

# Load all formulae for all supported platforms
brew readall --os=all --arch=all rsanheim/tap

# Run formula tests
brew test rsanheim/tap/git-all

# Optional extra formula lint pass. Homebrew 6 rejects path-based audit.
brew audit --strict --online rsanheim/tap/git-all
```

### Local Development

```bash
# Tap this local directory (use --force to override existing tap)
brew tap rsanheim/tap /path/to/homebrew-tap --force

# Install formula from local tap
brew install rsanheim/tap/git-all

# Reinstall after changes
brew reinstall rsanheim/tap/git-all
```

## Structure

* `Formula/` - Homebrew formula files (Ruby)
* `formula_renames.json` - Maps old formula names to new ones (e.g., `fit` → `git-all`)

## Updating a Formula

When updating a formula version:

1. Update the `version` string
2. Update SHA256 checksums for each architecture (get from GitHub release assets)
3. Run `brew style`, `brew readall`, and `brew test` before committing

### Updating `git-all`

`git-all` is distributed from prebuilt GitHub release tarballs. Update it from the `rsanheim/git-all` repo after its release workflow has uploaded all four assets:

* `git-all-<version>-darwin-arm64.tar.gz`
* `git-all-<version>-darwin-x86_64.tar.gz`
* `git-all-<version>-linux-arm64.tar.gz`
* `git-all-<version>-linux-x86_64.tar.gz`

Linux release artifacts should come from musl targets (`aarch64-unknown-linux-musl` and `x86_64-unknown-linux-musl`) so they are static and do not depend on a runner glibc version.

```bash
cd ~/src/rsanheim/git-all
script/update-homebrew <version>

cd ~/src/rsanheim/homebrew-tap
brew style rsanheim/tap/git-all
brew readall --os=all --arch=all rsanheim/tap
brew test rsanheim/tap/git-all
brew audit --strict --online rsanheim/tap/git-all
```

Verify Linux installs with OrbStack/Docker before publishing when the update changes Linux assets:

```bash
docker run --rm --platform linux/arm64 \
  -e HOMEBREW_NO_AUTO_UPDATE=1 \
  -e HOMEBREW_NO_REQUIRE_TAP_TRUST=1 \
  homebrew/brew:latest \
  bash -lc 'brew tap rsanheim/tap && brew install git-all && git-all meta'

docker run --rm --platform linux/amd64 \
  -e HOMEBREW_NO_AUTO_UPDATE=1 \
  -e HOMEBREW_NO_REQUIRE_TAP_TRUST=1 \
  homebrew/brew:latest \
  bash -lc 'brew tap rsanheim/tap && brew install git-all && git-all meta'
```

Use `HOMEBREW_NO_REQUIRE_TAP_TRUST=1` only in throwaway containers. On a real machine, use `brew trust`.
