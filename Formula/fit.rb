class Fit < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/fit"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/fit/releases/download/v#{version}/fit-#{version}-darwin-arm64.tar.gz"
      sha256 "c0553af1d0b6da6a6b333ea57d76e3e8f352226774a321db9d807a7cba21b25a"
    end
    on_intel do
      url "https://github.com/rsanheim/fit/releases/download/v#{version}/fit-#{version}-darwin-x86_64.tar.gz"
      sha256 "f113ca1d8306bd6150b9913dd64da999a74c95e38d382a61ff7a7aede4e7c4df"
    end
  end

  def install
    bin.install "fit"
  end

  test do
    assert_match "fit #{version}", shell_output("#{bin}/fit --version")
  end
end
