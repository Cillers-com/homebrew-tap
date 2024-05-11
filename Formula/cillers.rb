class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.0.10"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "14cb9377b92a117a6431e7a544b3829cdb5f71439cb7099cc23f96e03d23baf2",
    "linux-arm64" => "aaa10076c3fa4950516e9c616eeb90b571845a111b9e8482939e5d531c1c73ff",
    "macos-amd64" => "9ac99553a8046ffe8df9aafebf3392c63655959cf411b2d08902faad0731432f", 
    "macos-arm64" => "4ddf4a43ae4b51b7ccabcab086eeb21f7f2f39ffe6ae89fea86b5cfda6b298fa"
  }
  
  url "https://storage.googleapis.com/cillers-cli/cillers-cli-#{version}-#{@@image_variant}.tar.gz"
  sha256 @@shasums[@@image_variant]
  
  def install
    bin.install Dir["cillers-cli-*"].first => "cillers"
  end

  test do
    system "#{bin}/cillers", "help"
  end

end

