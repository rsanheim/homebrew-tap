class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.7/git-all-0.7.7-darwin-arm64.tar.gz"
      sha256 "2e2ef42897d70a9e3f2f120f83d7ed2fde9283af51108155d7774da1ee5cc816"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.7/git-all-0.7.7-darwin-x86_64.tar.gz"
      sha256 "31f293a63decab7830374fbb85d2dc1921b607374f2248b05fd8103fe3386b5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.7/git-all-0.7.7-linux-arm64.tar.gz"
      sha256 "688b36e90f112b3444518b1395aa11e0fe5234ec3f20afd0a1dbd37713fb8234"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v0.7.7/git-all-0.7.7-linux-x86_64.tar.gz"
      sha256 "603efef50d0a18cad775a94183a7e51b07b129e86ad10bf2f765af18dcff5c09"
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
