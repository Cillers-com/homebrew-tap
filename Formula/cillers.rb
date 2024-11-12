class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.6"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "02c95156182d65e857df485e0053e575ba3b20e4e27512c47718e458bd507acf",
    "linux-arm64" => "05066cab717cb9a5221c08a1c37caf625d6d524ad9b737a154cf1927d85a435f",
    "macos-amd64" => "613ca613172cbb68a70509e43992cd0d96e2bb432bbe3e06313528edc9fa99be", 
    "macos-arm64" => "1d393bcf0ec4a391c28adb5325eaf10a995c23acbd527ccc47a9ea9091dca707"
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

