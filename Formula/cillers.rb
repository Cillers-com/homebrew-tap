class Cillers < Formula
  desc "The Cillers CLI"
  homepage "https://cillers.com"
  version "0.0.3"
  url "https://github.com/Cillers-com/cillers-cli/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "f86a5458ed2a95498eddfe53ba5035e1341767b7903d95f6428ff04d129e6d63"

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

