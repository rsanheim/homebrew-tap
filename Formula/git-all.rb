class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "0892b7cd889efa97f7d91bcbc11aebe5602660e95179c715e46da8f8fa301532"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "e3bfdc3a77c40277981e689d68f3d6e1c8a7412c3d5ac5e0de89117ec47b62b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-arm64.tar.gz"
      sha256 "0ff8765fcac53b636d3ed0a778bb1321296646b6685d9b8afd5a936822e61d6d"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-x86_64.tar.gz"
      sha256 "2e272d0fc26d65bd907606ef3f2583c9735a8a257506bd00127a0fc3cda522fd"
    end
  end

  def install
    bin.install "git-all"
  end

  test do
    assert_match "git-all v#{version}", shell_output("#{bin}/git-all meta")
  end
end
