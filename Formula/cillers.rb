class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.0.13"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "bbd9a0a3882ef7fda8206b5fa3474b4832613d1a80925151cd1cc28fb130e20b",
    "linux-arm64" => "509e5333468dd5362fcbf076b88ca8848617dc9990f05e2deb2d3e2d834e7c10",
    "macos-amd64" => "4d34d6805f8fe99edc1247e637cb34cc966206475569b8f81faa110afe3b5720", 
    "macos-arm64" => "a180cea385bb82940465c9b4aa15ee6a4db476cc941abe07bfb95e1c409bcb68"
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

