class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.4.1"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "f8e855de09ecacc05b55ee2fe2ce125d371f533be1168bffe06d75c76849c753",
    "linux-arm64" => "093dad314bf4ae0c810e30f65237eff669f63a90d6c6c8846923540d71269673",
    "macos-amd64" => "e0307a8e71ad2c0c693a535f4d5ea5929c50a472c8fed35d370197402aec10c9", 
    "macos-arm64" => "791bf05bae8ec4421d66abe797221c966c78c0e5ba66835a9b2c8dbeca6dfd55"
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

