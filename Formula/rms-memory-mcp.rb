class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.2.0" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.0/rms_memory_mcp_1.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "04daea587f855921420a8da4f16bb9f924e150ed129c1039ca4dd2ac0bc5b5fe"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.0/rms_memory_mcp_1.2.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73f997d345021b409dfa2994ed665206f96bfc131914531a2ed4f6b8b10d99d0"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.0/rms_memory_mcp_1.2.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91c28fe80920aab88f7a16bd0540a88d989aaa0814f80ed961e6a369c14f3b26"
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
