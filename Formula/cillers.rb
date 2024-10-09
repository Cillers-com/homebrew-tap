class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.1.0"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "1787e42dbb31332bb6276419ecfe58a070cb7d438aefd4d22034ec7919c1a676",
    "linux-arm64" => "8a775c3a2a190595ee5b6acbd6afb931a66804c95473cb1ca4dbc191db1d4a29",
    "macos-amd64" => "c4fcf72517506bc8d02e6a666320f3d6ca52baf5bf83459b7d917bc6d205bee9", 
    "macos-arm64" => "5f2c2378ee812403b05486871926e53f1aa1dc93bd2e1e957ee9c4dbbb60517d"
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

