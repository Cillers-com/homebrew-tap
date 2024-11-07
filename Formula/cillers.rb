class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.1"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "6430b31647d7ff4ccaa3a07bf7e41c7d5b0dd8f6df843ab929d4ec6b461e9f64",
    "linux-arm64" => "b712f54fa808b546a1f101b4910e069425ac7b4137969560139d5e1864c782b5",
    "macos-amd64" => "c090b4068b539eb2c5e7e40e974f0bf1ebfb79f54f4d6e245a4c7b917bb7f20f", 
    "macos-arm64" => "2142658aa22290de7c1db4ac7e3626178d6c26b808584d66e0d94eb8af20a58c"
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

