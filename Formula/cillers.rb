class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.5.0"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "db8c706edeb04b1d7cfd03070af1ffc4e79988143edacbf0b91f9b22440bea96",
    "linux-arm64" => "edeee7d700919326ec6e9059c16cbe5ddbf9061b6ba13a9e9b166207b57e8ecf",
    "macos-amd64" => "33507891bec51dc2ff284bd54449eebb798d23fb73edb4e78174c29843dea075", 
    "macos-arm64" => "d90b1cc32f150edfc51e9eb3e8257103db1749eed55ecc7a6c22c093d4ffc805"
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

