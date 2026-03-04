# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Plur < Formula
  desc "fast parallel test runner, primarily for ruby/rails. single binary (written in Go)"
  homepage "https://github.com/rsanheim/plur"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rsanheim/plur/releases/download/v0.40.0/plur_0.40.0_Darwin_arm64.tar.gz"
      sha256 "06dcdf44f96811fb2f550cf7bd1514e9836e358edd233ec4d9bb655b4c683540"
    end
  end

  on_linux do
  end

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test plur`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
