class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.5.4"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "be2fe5fd4e6ba5f8b1cc6246d5a39c0980d049eaf46cdfeef3e42783c97001b9",
    "linux-arm64" => "77396b7ea08510caec2067fe90b3e33eb17d014772077db496a30c0cd4a686b8",
    "macos-amd64" => "6c157fc6f2a59178f354227421d552ee05e91d5a40baf011eced2315fbd37879", 
    "macos-arm64" => "7a1a7abf05065a4de42624e4f1b03f1c4428d07a4fae82aebb77b668e0257b09"
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

