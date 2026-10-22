class Dnsrivet < Formula
  desc "Lightweight encrypted DNS forwarding daemon for macOS"
  homepage "https://github.com/WenliangCao/DNSRivet"
  url "https://github.com/WenliangCao/DNSRivet/releases/download/v0.3.3/dnsrivet-v0.3.3-macos-universal2.zip"
  sha256 "2aa761c9da4169c252df36925e758936fd2d6814602e982cc378d927df881b62"
  license "MIT"

  depends_on macos: :big_sur

  def install
    bin.install "dnsrivet"
  end

  def caveats
    <<~EOS
      DNSRivet is installed but not started because it needs an upstream.
      Start it with, for example:

        sudo dnsrivet start --upstream 'doh3=https://resolver.example/profile'

      After `brew upgrade dnsrivet`, load the upgraded binary with:

        sudo dnsrivet restart

      Before `brew uninstall dnsrivet`, restore system DNS and remove the
      launchd service with:

        sudo dnsrivet uninstall

      The signed PKG and Homebrew formula are alternative installation methods.
    EOS
  end

  test do
    assert_match "DNSRivet #{version}", shell_output("#{bin}/dnsrivet version")
  end
end
