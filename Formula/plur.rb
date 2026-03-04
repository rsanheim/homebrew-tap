class Plur < Formula
  desc "Fast parallel test runner for Ruby/RSpec"
  homepage "https://github.com/rsanheim/plur"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/plur/releases/download/v#{version}/plur_#{version}_Darwin_arm64.tar.gz"
      sha256 "06dcdf44f96811fb2f550cf7bd1514e9836e358edd233ec4d9bb655b4c683540"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rsanheim/plur/releases/download/v#{version}/plur_#{version}_Linux_x86_64.tar.gz"
      sha256 "077ea8c18c31f42d2e8c3cd710045b4f3c9d2f16782c5a59437ee2825461759b"
    end
    on_arm do
      url "https://github.com/rsanheim/plur/releases/download/v#{version}/plur_#{version}_Linux_arm64.tar.gz"
      sha256 "88c1848925c4cd63a8236163187273cf9c61aa39bf9b5faaf919e6a061be63cb"
    end
  end

  def install
    bin.install "plur"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plur --version")
  end
end
