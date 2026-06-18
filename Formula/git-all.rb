class GitAll < Formula
  desc "Parallel git operations across many repositories"
  homepage "https://github.com/rsanheim/git-all"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-arm64.tar.gz"
      sha256 "39d084cc14edd6e08c03dc6f25f19807b30dd8b170a5c65bd9bf2d13f4b40de4"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-darwin-x86_64.tar.gz"
      sha256 "bf8b6c4c0138a4fbd1896c05ec65b4aaf9a9cdd6163f8aa6fecc4ad2742069ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-arm64.tar.gz"
      sha256 "6094e576c4173dd60eb513eb3a5b448eeec4043e5c5ad02cf08cff82db13aa76"
    end
    on_intel do
      url "https://github.com/rsanheim/git-all/releases/download/v#{version}/git-all-#{version}-linux-x86_64.tar.gz"
      sha256 "e9164f37ea0eae554a0dfeafd1f7e2d1799bc0d81640b65679ea28f32b45efa3"
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
