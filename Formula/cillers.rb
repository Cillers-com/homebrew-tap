class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.3.0"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "495ae5748b814b8072dbc3c987fc54c48abb113239440274669ea34e0770c462",
    "linux-arm64" => "9a8325ff77e37c351a5b0b6993a2257f1fdf099f9f38db3f1c9229cc744c7438",
    "macos-amd64" => "39914c2d3c696ec88277fa5cebbdbc66929b41af75e2cb8327a5fa66e9714e10", 
    "macos-arm64" => "dbf071aaaebb29d23027b52b497d0f592f2f670ba2b5991245c4aecd42d3b5aa"
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

