class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "00d24ebbfaa9890906dce74e0913c34cbca0a3a60854878c02e0471fe4044b63"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "ab02a6df47cb97f23f7810ca1f22b2d678e6e59bfcff7e617f7358c2967e1b0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-arm64.tar.gz"
      sha256 "e7b86bc898d4fb7fa44411f7df630564bcb4001ed3e03e98bda0dd60347765bc"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-x86_64.tar.gz"
      sha256 "90192d83b16c17c49552891dcdf285df88db6731946ec5ba99c10e801515ee4e"
    end
  end

  def install
    bin.install "git-all"
  end

  test do
    assert_match "git-all v#{version}", shell_output("#{bin}/git-all meta")
  end
end
