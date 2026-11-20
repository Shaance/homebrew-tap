class Hn < Formula
  desc "Read Hacker News stories and comment threads in your terminal"
  homepage "https://github.com/Shaance/hn"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.2/hn-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "c4af975b059abb5ebb9fea7d09622a2d1321b06082d504573addbb7429cf5096"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.2/hn-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "a947a61d5c544bc8716f926f2606c64e86870e380c1159283d0a6a6d5f8ebce7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.2/hn-0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "314bd4ea585b0a5cd2cf02e719542f798915b3e3f065cd2353042df7b1741670"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.2/hn-0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0fdd68ae40149b3333837af6089132356047bb87ad67f82b9e9c7c98a16a9d7"
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
