class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "d7d403b0c67a75e6f8790a802725185523a064ef7dd73df107956481fdbb7f41"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "62cd2da1642d18f626306e2c3c53454344798c66d2fd56e45ddb87745d342595"
    end
  end

  def install
    bin.install "git-all"
  end

  test do
    assert_match "git-all v#{version}", shell_output("#{bin}/git-all meta")
  end
end
