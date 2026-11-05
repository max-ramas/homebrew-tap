class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.4.0" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.0/rms_memory_mcp_1.4.0_aarch64-apple-darwin.tar.gz"
      sha256 "c8a7acefc58f1d4e0782feb5eb0db500c3c136752357544a0da991842714f6b6"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.0/rms_memory_mcp_1.4.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52c1da94ecb3acdc14ec0db9ec3c7b496d3d3960604562b6fd335246a6f28c48"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.0/rms_memory_mcp_1.4.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e08aa030efca1e8ff16cb9ebbed3657074c55f0c0ab2d93a9ef55cb3e2c1cc3a"
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
