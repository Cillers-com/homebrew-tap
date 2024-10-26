class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.1.3"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "b26a254e8eecd43930930c5435cfd00b9096aeaf66267a6eac0f6448a4851c6f",
    "linux-arm64" => "7957d54a66e806c20e46b8eb7456a1127839045ae0be20bb3ee31d90c3c78347",
    "macos-amd64" => "4cbfa2674a7a917a24c2a904bc03290b133f3a92415f717b0991805f6fa97b08", 
    "macos-arm64" => "6b2c3dc4b7507bcab61adc88162d1706581d496b3b1f33b25460fd3f5e4df345"
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

