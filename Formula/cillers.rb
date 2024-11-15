class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.7"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "652ceaaf277ef8159784e817f5bbc0376309cfc335fd4b8ebf46673b3a568ce2",
    "linux-arm64" => "49c50f69a3137de5a45c0ceccebf4efcfb947c86c15627a5fe2a5a3bad922c4e",
    "macos-amd64" => "9c85bfb94089e0dab329307a2cf936e59ec99bed9f4a867d9853a8d5a4d9a261", 
    "macos-arm64" => "9ec2b6837a11cc33b5d4897ed6adc740aeaeee691aa06a739e0c8d3cfba2a166"
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

