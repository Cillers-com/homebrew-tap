class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.4.0"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "67a2f4a10ad7bb4e2d5a233a3da2200e888a66bdcc84767538860b84c7c73fce",
    "linux-arm64" => "d51ad20eb1970bd1c857de49b7ba137e1bd6746ab1b3427b0d8a591aaf461f9a",
    "macos-amd64" => "0eff16ff0c9bc3dbd8e73f1f93615ba1911bf8a2ea60c8220379c86ee05426c5", 
    "macos-arm64" => "c63a2d1944be2640b499fc9c4ea7a8aff7b8f6274f32e10133cbb406e5e24d6e"
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

