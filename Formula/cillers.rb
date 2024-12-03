class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.5.3"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "5f50109faf57344faa51900efcf9b93f4854bac793bd25cc50f5187e7792db9c",
    "linux-arm64" => "6b60232b4fb3f51e5200f8a7342dfd8cb175e9aee5bc3ef713020d8cf14ab797",
    "macos-amd64" => "d0534d5025198d85326a62383842b0fba30627450dbd510b34c7c469f8f57f85", 
    "macos-arm64" => "f16a0d6f44e06a0973e76746180426bb660fccf5aa699b4b2170ab5adf5cb5be"
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

