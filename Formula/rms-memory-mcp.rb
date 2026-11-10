class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.5.1" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.5.1/rms_memory_mcp_1.5.1_aarch64-apple-darwin.tar.gz"
      sha256 "49883fb4f928f804945289f91f3b706e7c119a278f7c526a13e65c73f6b99baf"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.5.1/rms_memory_mcp_1.5.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d329f49cb2d2921ab602513fc6c4271964861f436660b89920db800bd108b90"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.5.1/rms_memory_mcp_1.5.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55a04af12f6ff2cbc3b74cfa80844d07de5d6afb56936cf60dbd19558ddd37a4"
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
