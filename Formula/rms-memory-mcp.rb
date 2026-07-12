class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.0.4" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.4/rms-memory-aarch64-apple-darwin.tar.gz"
      sha256 "bd43e483dd7f1049431bcc4b90e41e8d4725e0c12aae41afaad95eb2f482aa6e"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.4/rms-memory-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a71f4c8d206fa0927ef00c30954d4347acc9b365a49114072db6318c8eb313ac"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.4/rms-memory-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea124649829a245b7e6b5568e1144cc433fdaefe27e066b79b560541f0f5f195"
    end
  end

  def install
    # Confirmed: the compiled binary inside every rms-memory-*.tar.gz is
    # named "rms-memory" (not "rms-memory-mcp") — matches the CLI usage
    # documented in the project README (`rms-memory serve`, etc).
    bin.install "rms-memory"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rms-memory --version")
  end
end
