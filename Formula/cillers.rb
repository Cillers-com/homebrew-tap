class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "v0.2.3"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"
  @@image_variant = "#{@@os}-#{@@arch}"
  @@shasums = {
    "linux-amd64" => "f1eb0d989697b28a36763d4b2503af0ab3bb7bf4d7d460f60b79af1b4de86e14",
    "linux-arm64" => "f62b9780d1130f49c14d4f75739c2b34f79c85d1c7d7ac87842912ffc33b1e81",
    "macos-amd64" => "0747051e5ae939764cbe7230390d5bf09d691e3cdb21fba8a0e480a4e49f68b8", 
    "macos-arm64" => "7d91c7e1cb59fb31f522b7dccde565533d6d46f6979c65fbfcac5bcf98cac084"
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

