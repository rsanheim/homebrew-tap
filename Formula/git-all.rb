class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_ARM64"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER_X86_64"
    end
  end

  def install
    bin.install "git-all"
  end

  test do
    assert_match "git-all v#{version}", shell_output("#{bin}/git-all meta")
  end
end
