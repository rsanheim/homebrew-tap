# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Homebrew tap containing custom formulae for rsanheim's tools. The tap is installed via `brew tap rsanheim/tap`.

## Commands

### Linting and Validation

```bash
# Lint a formula (strict mode)
brew audit --strict rsanheim/tap/git-all

# Check Ruby style
brew style rsanheim/tap/git-all

# Run formula tests
brew test rsanheim/tap/git-all
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
3. Run `brew audit --strict` and `brew style` before committing
