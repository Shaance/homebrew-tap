class Hn < Formula
  desc "Read Hacker News stories and comment threads in your terminal"
  homepage "https://github.com/Shaance/hn"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.0/hn-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c1ce78f9c1402d22c0aaade92bb0131026d30539b957936a7f861e95429e76b8"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.0/hn-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "8a45c3d81e97f91a69aef84224d09342b2faaa6cdc226f0790ea538113b71f90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.0/hn-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4e7f20fc3617eed3ab9bf0d2235ad220c6f12c108c5ef4b17a65358c45afbd2"
    end
    on_intel do
      url "https://github.com/Shaance/hn/releases/download/tui-v0.2.0/hn-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0cd369b0d83cb7e8f105ad1450921a56e0361e6f3e3cbcbb7e0e84d3575f406"
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
