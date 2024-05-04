class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "0.0.2"
  url "https://github.com/Cillers-com/cillers-cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "affb423ebe111ae0a8a71899b9be040e5522293942ea5fbbe949b2a6fb6fd4c5"

  def install
    # Install everything into libexec
    libexec.install Dir["*"]

    # Create a wrapper in the bin directory
    (bin/"cillers").write_env_script libexec/"cillers.rb", GEM_HOME: Formula["ruby"].opt_libexec/"gem"
  end

  test do
    system "#{bin}/cillers", "help"
  end
end

