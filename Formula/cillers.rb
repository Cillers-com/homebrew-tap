class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "0.0.8"

  os = "#{OS.mac? ? 'macos' : 'linux'}"
  arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  image_variant = "#{os}-#{arch}"
  shasum = { 
    "linux-amd64" => "6f535e229239bacfe1e17d26c13783c027a29cbb6bc685084e7a2d7dd5f67a01",
    "linux-arm64" => "a3b459fc609aebf1355073cee21028c5293e16dc1d1c64155be69803ddb047c7",
    "macos-amd64" => "0b3278c2a28463d06aa720def840da3421bc36718ffb2b2aa92ebf5057630b4c", 
    "macos-arm64" => "127550cbdd359a68f02c9b52fd7b8ec29797e04c125f29ebcbd1a0940356797b"
  }[image_variant] 
  
  url "https://storage.googleapis.com/cillers-cli/cillers-cli-#{version}-#{image_variant}.gz"
  sha256 shasum
  
  def install
    bin.install "cillers-cli-#{version}-#{image_variant}" => "cillers"
  end

  test do
    system "#{bin}/cillers", "help"
  end

end

