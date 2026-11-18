class Dnsrivet < Formula
  desc "Lightweight encrypted DNS forwarding daemon for macOS"
  homepage "https://github.com/WenliangCao/DNSRivet"
  url "https://github.com/WenliangCao/DNSRivet/releases/download/v0.4.3/dnsrivet-v0.4.3-macos-universal2.zip"
  sha256 "91dc8aa58b3c9e786842cbfbfd7ee10bd6f296b39f71f448c62e136b9988758e"
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
