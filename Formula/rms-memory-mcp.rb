class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.4.1" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.1/rms_memory_mcp_1.4.1_aarch64-apple-darwin.tar.gz"
      sha256 "9c72b4a953d2ca7c7d847279fa5483efb7366260a2305b204b42c4a9f784d441"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.1/rms_memory_mcp_1.4.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2552ce4b6b944c3ca076e2f9cb0c60346ec3cecda33f469ee2150f70b03ff42d"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.1/rms_memory_mcp_1.4.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc2c0640a5ba4945486f6e4dd92be385156df9c695f02c256d066b8fd8518857"
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
