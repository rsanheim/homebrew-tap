class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "2805850f1ecf455caf964c7473c0411f6554cf10d3b057534c615c699cb6acfa"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "869b6554a398a3afe7e841c76eeb23bc129606b6e35bad34e88522ab0cb255e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-arm64.tar.gz"
      sha256 "5150b2b3dc85acde94fd0bdd0bc2b99d4ff2ce1e0f8faf6449e7abff7253a8c5"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-x86_64.tar.gz"
      sha256 "c8847d5c1f534b449c61c4a4a7ef30961a8a59ce847a76fe1383a4d0b6721ce3"
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
