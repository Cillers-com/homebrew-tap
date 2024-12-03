class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.5.2"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "5a7c23a47bb84fe91b80e943b39db4ba9ab75909f09c0c7eadbee1009fb51bde",
    "linux-arm64" => "8f1281e52cf35515571013c3c42c8d4af265f5bb6817cdc79de23582cad6a605",
    "macos-amd64" => "56cefccfcd68d940ce4e4688042e98d35f39e0672a143f69cb6684085cdecf82", 
    "macos-arm64" => "1dfd4e21cfa5089a2c5c9286199efdfc97933ecd4c46eaffc077159f19dcb0de"
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

