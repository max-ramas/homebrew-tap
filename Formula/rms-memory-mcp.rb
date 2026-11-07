class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.4.2" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.2/rms_memory_mcp_1.4.2_aarch64-apple-darwin.tar.gz"
      sha256 "82f1719ee528c11f1f7807ddd1bf5ad12fe8954a9054e8acb2b4b62fa9b5107b"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.2/rms_memory_mcp_1.4.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "488cfa387a22660dbd0328832706d5f0bce90cd8ad0eed3dfe658ca213e7aeb8"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.2/rms_memory_mcp_1.4.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9a05d1278f98cb09a3b78ce01600f77f4598a98a67fcf6c810dc33c94c77aac"
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
