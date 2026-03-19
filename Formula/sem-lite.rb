# Homebrew formula for sem-lite
# To use: brew install semwerk/tap/sem-lite
#
# This formula downloads pre-built binaries from GitHub Releases.
# It does not build from source (sem-engine dependency is proprietary).

class SemLite < Formula
  desc "Local-first documentation intelligence CLI"
  homepage "https://github.com/semwerk/sem-lite"
  version "0.8.0"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/semwerk/sem-lite/releases/download/v#{version}/sem-lite_#{version}_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    else
      url "https://github.com/semwerk/sem-lite/releases/download/v#{version}/sem-lite_#{version}_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    url "https://github.com/semwerk/sem-lite/releases/download/v#{version}/sem-lite_#{version}_linux_amd64.tar.gz"
    sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
  end

  def install
    bin.install "sem-lite"
  end

  test do
    assert_match "sem-lite", shell_output("#{bin}/sem-lite --help")
  end
end
