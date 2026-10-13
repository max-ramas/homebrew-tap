class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.2.2" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.2/rms_memory_mcp_1.2.2_aarch64-apple-darwin.tar.gz"
      sha256 "1f5bed6bf128d008ba79776f80f44e5f943c5e5b47c2b109a442bbb51fae6ee8"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.2/rms_memory_mcp_1.2.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "754958a6c87240551b38ddad0746ab2c9377e58d71a9325cdd8a3fb078b8430f"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.2/rms_memory_mcp_1.2.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0630b2dff32644c6610be653c48990b70c376eaa511b70407e0768d72f62eb82"
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
