class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.5.1"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "05e793c99dd1fe428eaa1aba138fab12eb69394a1ddad221071f74408a468192",
    "linux-arm64" => "a833456874aecae44264b3c72531d863e7aacefbc250021000696a92c5250538",
    "macos-amd64" => "8aa98be855bff805478e7641c65061bfd12212866202f5fc7850f56811f519fc", 
    "macos-arm64" => "7b8ff9d57e6cfbd4841f3325efbd8f7c599ff977feff810662c977a9851bbdae"
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

