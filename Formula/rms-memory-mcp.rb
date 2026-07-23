class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.0.6" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.6/rms-memory-aarch64-apple-darwin.tar.gz"
      sha256 "689baf6e6466936fbe8caa778c02d056762007cdad0871391313543d3a5004bf"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.6/rms-memory-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "532da5f5147ec72097a84145b13c8844b1572815ad70187be3161f85f9f14e74"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.6/rms-memory-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05af70632aca49c51fc3adbceb051ee026d91dcfe814a6a38db0336b928d8b09"
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
