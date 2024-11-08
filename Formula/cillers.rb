class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.1"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "ed9cb592273097e0cfd1820eba4b1e1f73cdddbcda6bf50f755c81fa5dcf619a",
    "linux-arm64" => "211d25388f386f461dae63dcb06e884f1b3908176b9f7f740af2cd0ae56175e3",
    "macos-amd64" => "c3936428116d28a09dd41ac4338c55b3d595cf87411bd56e802e7a6d35fa487d", 
    "macos-arm64" => "d37d3cdb2a90c19acc92712af293188f062f581e1a8551600d231d8297ae83e1"
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

