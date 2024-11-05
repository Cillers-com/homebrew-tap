class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.1.3"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "e871097f7d30e084f09d0fc8d29e954704d40787bb4ca1727b7028cfb82f7364",
    "linux-arm64" => "082e6d07cbc73a6d25048b612198bc10830b6978a9a05f6148dc628400207575",
    "macos-amd64" => "5e8fcdc67898df28fde7c1343bf15abd6f7c615a9af42da4d00cf6cf6d5f3e90", 
    "macos-arm64" => "6e7148bf8edc7392603188837f5219e8ebc8860dd2355146e1d6381a15d9bbfd"
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

