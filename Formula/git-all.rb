class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "9245d6d6b5cfab3426a64bfd0c7204b8c5bccd024440da1db46166d757e18798"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "a69d9308e0295d0165869bee1b33274376310096e7b4a42e5301985cbc02c8ac"
    end
  end

  def install
    bin.install "git-all"
  end

  test do
    assert_match "git-all v#{version}", shell_output("#{bin}/git-all meta")
  end
end
