class Hn < Formula
  desc "Read Hacker News stories and comment threads in your terminal"
  homepage "https://github.com/Shaance/hn"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.3/hn-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "9a296bd70acfa4c82d9407a733af208bc9780936584293525a296992b6533b5e"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.3/hn-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "abc08587e995b3d23c556d287d0031e1396e364a79513646965104d7a4034327"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.3/hn-0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "208f20443f2df48ff27faf9d3eb942482445579fe8f92b69732382fd1e2f497c"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.3/hn-0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "426da3f5816d6ba44504e03958bb18e84c8d9077061dc95154727ecdb51779c5"
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
