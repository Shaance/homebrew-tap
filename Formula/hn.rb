class Hn < Formula
  desc "Read Hacker News stories and comment threads in your terminal"
  homepage "https://github.com/Shaance/hn"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.3.0/hn-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "bbb3c715dfa3612d674bbc83a8622c1fef3e69c27708f97f13cae94b5c3e6a94"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.3.0/hn-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "f536a22f6688ce0c050592a2d7283b1855732b75a031cde57224ed5a347dade8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.3.0/hn-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc832ec329508d1b0920df7fd87cad6825eb523bd9fe81e3e05a5750ae91f672"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.3.0/hn-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31fbddef46a67b94fafa940b06f5f649b9c1bcbfbfa5d8c75b2d3d9bb2d4128b"
    end

    depends_on "openssl@3"
  end

  def install
    bin.install "hn"
  end

  test do
    assert_equal "hn #{version}\n", shell_output("#{bin}/hn --version")
  end
end
