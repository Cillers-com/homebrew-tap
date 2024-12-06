class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.5.5"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "8b655884863b21d8597efbfc374418bce24338ef69d9d466a5ea324b19b80d66",
    "linux-arm64" => "6917c4e525d30a0b5d2d358813144484f341c64509fb632fd8b0edd82ff34f38",
    "macos-amd64" => "14635dbea88069e7b1a67d2531f025f77416bf763389005c25551e7f41315313", 
    "macos-arm64" => "825dcc8c2a43735db1f7e5cbe4f609f91f907d094f705bbbf032dd9243b24efa"
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

