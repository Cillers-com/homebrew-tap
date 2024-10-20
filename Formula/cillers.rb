class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.1.2"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "23cce0c9aef3cfec9ad71405a85b79a2071f8aef5eff358871a0a57b6de807cc",
    "linux-arm64" => "fc8a939404aec51227c90302b596b7123e02d0505a43cd6f3e3d900a1ebe30c1",
    "macos-amd64" => "c55eba452f9b0f594ed796722059cfa3c99a24730bcc2356feacfca8754dd6b5", 
    "macos-arm64" => "748235140de7cdafae4fd4b789d384ae28d3b6dc4972fa5d9969353baccbc798"
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

