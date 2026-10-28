class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.3.2" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.2/rms_memory_mcp_1.3.2_aarch64-apple-darwin.tar.gz"
      sha256 "c8a521763ad9543a8f2370e3ad9d6e3f49569bae0c6097e56596754f227e5895"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.2/rms_memory_mcp_1.3.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3335e17d9cb6380be086039a18266aeb34929bccbb2344ab28378f627c5ad3f3"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.2/rms_memory_mcp_1.3.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e41091927da9651ad83a7214a1acf3ce2d65abe8202d0a473465c5241d7fab09"
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
