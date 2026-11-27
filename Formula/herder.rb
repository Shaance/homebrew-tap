require "json"
require "open3"
require "timeout"

class Herder < Formula
  desc "Dispatch, track and verify coding agent runs"
  homepage "https://github.com/Shaance/herder"
  url "https://github.com/Shaance/herder/releases/download/v0.6.0/herder-macos-universal.tar.gz"
  sha256 "712bcab12e1fda53794a2c5b6d2f6ce2682271906319b9a17d556a0a67653249"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos
  uses_from_macos "jq", since: :sequoia

  def install
    bin.install "herder", "herder-mcp"
    doc.install "README.md", "MCP-README.md", "LICENSE-MIT", "LICENSE-APACHE"
  end

  def caveats
    <<~EOS
      To configure the optional MCP companion for Codex or Claude Code, see:
      #{doc}/MCP-README.md
    EOS
  end

  test do
    assert_equal "herder #{version}\n", shell_output("#{bin}/herder --version")
    assert_equal "herder-mcp #{version}\n", shell_output("#{bin}/herder-mcp --version")
    ENV["HERDER_STATE_DIR"] = (testpath/"state").to_s
    Timeout.timeout(10) do
      Open3.popen2((bin/"herder-mcp").to_s, "--herder", (bin/"herder").to_s, "--repo", testpath.to_s,
                   "--model", "brew-smoke-test", "--effort", "low") do |input, output, process|
        input.puts({ jsonrpc: "2.0", id: 1, method: "initialize", params: {
          protocolVersion: "2025-11-25", capabilities: {}, clientInfo: { name: "brew test", version: "1" },
        } }.to_json)
        assert_equal 1, JSON.parse(output.readline).fetch("id")
        input.puts({ jsonrpc: "2.0", method: "notifications/initialized" }.to_json)
        input.puts({ jsonrpc: "2.0", id: 2, method: "tools/call", params: {
          name: "status", arguments: { goal: "brew-smoke-test", name: "missing-run" },
        } }.to_json)
        assert_equal "not_found_yet", JSON.parse(output.readline).dig("result", "structuredContent", "outcome")
        input.close
        assert_predicate process.value, :success?
      end
    end
  end
end
