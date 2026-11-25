class Herder < Formula
  desc "Dispatch, track and verify coding agent runs"
  homepage "https://github.com/Shaance/herder"
  url "https://github.com/Shaance/herder/releases/download/v0.3.0/herder-macos-universal.tar.gz"
  sha256 "430dbf71f939b9db7e8d17dd7350d7b29b1cdc135bc56263fc6e317d12375c04"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos
  uses_from_macos "jq", since: :sequoia

  def install
    bin.install "herder"
  end

  def caveats
    <<~EOS
      To let a coding agent drive herder, link the herder skill into its host.
      See https://github.com/Shaance/herder#readme
    EOS
  end

  test do
    assert_equal "herder #{version}\n", shell_output("#{bin}/herder --version")
    ENV["HERDER_STATE_DIR"] = (testpath/"state").to_s
    assert_equal [], JSON.parse(shell_output("#{bin}/herder ls --json")).fetch("data").fetch("runs")
  end
end
