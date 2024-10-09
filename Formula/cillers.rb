class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.1.1"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "eda12e306ca4879e6f8b676463fd2f620a47185af3bdcf4c6e00ff00d59546f1",
    "linux-arm64" => "f78f490a893b062eb7511b2d47d3a850d0d29111f544175ebd6e5e6895c4b325",
    "macos-amd64" => "cda852060c213d2f890af58acfa5f2742e24684419dc47d0578a93f516a6bcb8", 
    "macos-arm64" => "29e1b7321c8c6b7af2102294fa4f98821bf9b861477155eeb421c3cab4c6f91b"
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

