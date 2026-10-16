class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.6/git-all-0.7.6-darwin-arm64.tar.gz"
      sha256 "245c8028e07bbbcd6da18294975deedd457611ee256d92632e5fb6bd7e6ecf6d"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.6/git-all-0.7.6-darwin-x86_64.tar.gz"
      sha256 "5c4823958c6b9869e9164d2407eec6730a04f7ae6dd7b08aeae2ec89c99afa4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.6/git-all-0.7.6-linux-arm64.tar.gz"
      sha256 "8932a865ab98cc74ded40b1b12496b4b5773bcdf3917b43a1282495386a2d5fd"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.6/git-all-0.7.6-linux-x86_64.tar.gz"
      sha256 "60ab317594d86cd3948beefa1a9578d37dac8bec35cf5ae1ec4f7580d03f9ef7"
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
