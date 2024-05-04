class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "0.0.2"
  url "https://github.com/Cillers-com/cillers-cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "affb423ebe111ae0a8a71899b9be040e5522293942ea5fbbe949b2a6fb6fd4c5"

  def install
    ohai "Current directory: #{Dir.pwd}"
    system "ls", "-la"

    bin.install "cillers.rb" => "cillers"
  end

  test do
    system "#{bin}/cillers", "help"
  end
end

