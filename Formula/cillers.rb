class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.2"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "856da87da4266eb924f3e36e1bcff237b2a1dd033bfc927791179becf2538722",
    "linux-arm64" => "9b065ae51b10f2f0a24f1441601af40e0b8c94751c7370a27ebcc920577146d3",
    "macos-amd64" => "72af5b8cc0996ceb6f95531adffbb1234d30f9e4282a33164dc58dfba43aba9c", 
    "macos-arm64" => "3da82cc8aad2e381ef26417aed8e274f00ff59603e3d672a613868258f19a61b"
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

