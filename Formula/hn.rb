class Hn < Formula
  desc "Read Hacker News stories and comment threads in your terminal"
  homepage "https://github.com/Shaance/hn"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.1/hn-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "b97bcd66c2e804a7ea6875c83298f031134054d635910b1ded35e670762b1dc8"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.1/hn-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "0e71479ae79c67b7425803f35ef4a6c3c7da1ea7247067c278921bb51cf4e292"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.1/hn-0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7dc5f071c61ee132f366626fb076a92b20309d74768b6828f3fd0e7aa6846bbd"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.1/hn-0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "947c404bc65bfd40cbb28718493558ac7bfbd6213f306642d58365c9d8323926"
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
