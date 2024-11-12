class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.5"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "21ff3442ded908d2cd842145e06c34daacf617543fcaf5606b3a638e9ff38dff",
    "linux-arm64" => "3891edceb6305f5ee58920e384f314c83ea349eec6cdc4a6c2daad4e3273c5e7",
    "macos-amd64" => "673abce953fa6b5366bc66386ad0cd1178b2d29313edcff69e625dbf7b7d8ba4", 
    "macos-arm64" => "19859003ee6bea0413c50755a7977f1dd516ac14c69cfde46deedea1c5696406"
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

