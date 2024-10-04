class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.1.0"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "8a7848bdace5be61ed69f3a34be3f86d017687b53cffff0e68ca7af6f48ccd17",
    "linux-arm64" => "aaae925f4b184a81b45ef596635445e4614f3d280e86a026d25706579e1872b2",
    "macos-amd64" => "e468a6f6d4ca0be4ea249882022f180a6d633b5836ce09fead7a356a8c1ee3b3", 
    "macos-arm64" => "583341d9806602cb33998829ecf44b04d6f6af1a64149581fb9cf778b9fd0ac1"
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

