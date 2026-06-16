# rsanheim Homebrew Tap

My Homebrew [tap](https://docs.brew.sh/Taps) for custom tools.

## Install

`brew install rsanheim/tap/<formula>`

Or `brew tap rsanheim/tap` and then `brew install <formula>`.

Or, in a `brew bundle` Brewfile:

```ruby
tap "rsanheim/tap"
brew "git-all"
brew "plur"
```

## Available Formulae

* [git-all](https://github.com/rsanheim/git-all) - Parallel git operations across many repositories
* [plur](https://github.com/rsanheim/plur) - Fast parallel test runner for Ruby/Rails

## Validation

Use formula names, not formula file paths. Homebrew 6 rejects path-based audit/fetch for formulae that are not loaded from an installed tap.

```bash
brew style rsanheim/tap/git-all
brew readall --os=all --arch=all rsanheim/tap
brew test rsanheim/tap/git-all

# Optional extra lint pass.
brew audit --strict --online rsanheim/tap/git-all
```

## Updating `git-all`

`git-all` is installed from prebuilt release tarballs, not Homebrew bottles. The release in `rsanheim/git-all` must publish all four assets before this formula can be updated:

```text
git-all-<version>-darwin-arm64.tar.gz
git-all-<version>-darwin-x86_64.tar.gz
git-all-<version>-linux-arm64.tar.gz
git-all-<version>-linux-x86_64.tar.gz
```

The Linux assets should be built with the musl targets (`aarch64-unknown-linux-musl` and `x86_64-unknown-linux-musl`) so they are static and do not depend on the runner's glibc version.

After the release workflow finishes:

```bash
cd ~/src/rsanheim/git-all
script/update-homebrew <version>

cd ~/src/rsanheim/homebrew-tap
git diff
brew style rsanheim/tap/git-all
brew readall --os=all --arch=all rsanheim/tap
brew test rsanheim/tap/git-all
```

For Linux install checks, OrbStack/Docker can exercise both architectures:

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

`HOMEBREW_NO_REQUIRE_TAP_TRUST=1` is only for these throwaway containers. On a real machine, use Homebrew's tap trust flow.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
