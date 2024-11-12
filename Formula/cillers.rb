class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.4"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "7908a7fad423b948f7fa5138d901347fb8155ce790812bffd516613137a8201f",
    "linux-arm64" => "ac011f02ddd0019a7f2b143fea4fe9f734869720fa3ebe934437609bb90f3fe7",
    "macos-amd64" => "eb8e6030e1c32b2e6343769bfab4ed6b66b2414e60df87e64ce619fb6970ca1e", 
    "macos-arm64" => "98fab914900e325a0f3f64bb37e780db00c760d260e94c8527337751cd9d2c79"
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

