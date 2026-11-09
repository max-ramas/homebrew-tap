class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.5.0" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.5.0/rms_memory_mcp_1.5.0_aarch64-apple-darwin.tar.gz"
      sha256 "4e1c72fca137e52227e916e369663b3eb4ab5439e46f8d7043e6e63248b14620"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.5.0/rms_memory_mcp_1.5.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e2ac6a4bff070cad982138c2178de12ac078fa42dbe444ed03b894d495aa3d4"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.5.0/rms_memory_mcp_1.5.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27449845fbeddc368b3d62b80bb1122ffcb2e8f4dde047f5f5fa1d271d9a8183"
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
