# dnsrivet/homebrew-tap

Homebrew tap for [DNSRivet](https://github.com/WenliangCao/DNSRivet) — a lightweight
encrypted DNS forwarding daemon for macOS (DoH, DoH3, DoT, DoQ).

## Install

```bash
brew install dnsrivet/tap/dnsrivet
```

Homebrew requires non-official taps to be trusted before it will load them. If the
install is refused, trust the tap and retry:

```bash
brew trust --tap dnsrivet/tap
```

The formula installs the signed, notarized Universal 2 binary published in the
[DNSRivet releases](https://github.com/WenliangCao/DNSRivet/releases). It does not
pick an upstream or take over DNS. Start it explicitly:

```bash
sudo dnsrivet start --upstream 'doh3=https://resolver.example/profile'
```

After `brew upgrade dnsrivet`, load the new binary into the system service:

```bash
sudo dnsrivet restart
```

Before removing the formula, restore system DNS and unload the launchd service:

```bash
sudo dnsrivet uninstall
brew uninstall dnsrivet
```

Do not combine this tap with the signed `.pkg` installer on the same machine.
