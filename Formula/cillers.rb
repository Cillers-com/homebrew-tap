class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.0"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "1896f310872e9dcd072547e68894495b13b31dfb197ecdf949351dd5edbfa04e",
    "linux-arm64" => "4bceec3e133259f33760ffd02d975da75a0d3b56c35ea6966de2e83c66affff8",
    "macos-amd64" => "558820ae4d3dbea4fedfa515c94579ebf9938e71c277e35afdc54c629fb818a6", 
    "macos-arm64" => "cf6d5c712201d2684af391c77eeb387e1764c4d1448aa091aeaecb3715d6da06"
  }
  
  url "https://storage.googleapis.com/cillers-cli/cillers-cli-#{version}-#{@@image_variant}.tar.gz"
  sha256 @@shasums[@@image_variant]
  
  def install
    bin.install "cillers-cli" => "cillers"
  end

  test do
    system "#{bin}/cillers", "help"
  end

end

