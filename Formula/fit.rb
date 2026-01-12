class Fit < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/fit"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/fit/releases/download/v#{version}/fit-#{version}-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/rsanheim/fit/releases/download/v#{version}/fit-#{version}-darwin-x86_64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "fit"
  end

  test do
    assert_match "fit #{version}", shell_output("#{bin}/fit --version")
  end
end
