class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "53298139b418ed7944302ca0a441eb76f5d0ece795803c44f3370047e168db04"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "b73c10563a33d545dfca61318714ad81cc6fe0a7a1252613658b960603c9f664"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-arm64.tar.gz"
      sha256 "536f35219b97d92c9a04ddb595e47784c6d287c92e44b2873b5f95d7f39935de"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-x86_64.tar.gz"
      sha256 "5397628710b763d1cb316a49156e7dbbaceb0254e42ba8750a98d261af5faa07"
    end
  end

  def install
    bin.install "git-all"
    man1.install "git-all.1"
  end

  test do
    assert_match "git-all v#{version}", shell_output("#{bin}/git-all meta")
    assert_path_exists man1/"git-all.1"
  end
end
