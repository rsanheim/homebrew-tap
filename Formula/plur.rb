class Plur < Formula
  desc "Fast parallel test runner for Ruby/Rails"
  homepage "https://github.com/rsanheim/plur"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/plur/releases/download/v#{version}/plur_#{version}_darwin_arm64.tar.gz"
      sha256 "f3b4cbd3dcc88afc413022997954d9b3d6e03180b01c617b32ff9fe84e41a2ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rsanheim/plur/releases/download/v#{version}/plur_#{version}_linux_x86_64.tar.gz"
      sha256 "3a5214f3ddffd410dbe62c02755d777627388977ae35fc4e316629b7e67faf0d"
    end
    on_arm do
      url "https://github.com/rsanheim/plur/releases/download/v#{version}/plur_#{version}_linux_arm64.tar.gz"
      sha256 "b91e5cfe9fee9b1087453279c86e907ae50921534bc612224a313049d569695c"
    end
  end

  def install
    bin.install "plur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plur --version")
  end
end
