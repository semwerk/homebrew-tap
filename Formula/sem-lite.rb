# Homebrew formula for sem-lite
# To use: brew install semwerk/tap/sem-lite
#
# This formula downloads pre-built binaries from GitHub Releases.
# It does not build from source (sem-engine dependency is proprietary).

class SemLite < Formula
  desc "Local-first documentation intelligence CLI"
  homepage "https://github.com/semwerk/sem-lite"
  version "0.9.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/semwerk/sem-lite/releases/download/v#{version}/sem-lite_#{version}_darwin_arm64.tar.gz"
      sha256 "7fdcfbb8ca6c2ad018ba3595a1101f07cd481f2ebbda1b6c20116c657908d207"
    else
      url "https://github.com/semwerk/sem-lite/releases/download/v#{version}/sem-lite_#{version}_darwin_amd64.tar.gz"
      sha256 "44e8377ac95bf1b7f8bb076cb94dd4ee9dd4555b2276c8d82eb7e31c3bde666b"
    end
  end

  on_linux do
    url "https://github.com/semwerk/sem-lite/releases/download/v#{version}/sem-lite_#{version}_linux_amd64.tar.gz"
    sha256 "e329a1c60f3d7a095c560b8d36df345a0ab355f28ead1e14c0c8e1f401cbf3b5"
  end

  def install
    bin.install "sem-lite"
  end

  test do
    assert_match "sem-lite", shell_output("#{bin}/sem-lite --help")
  end
end
