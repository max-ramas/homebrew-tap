class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.3.1" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.1/rms_memory_mcp_1.3.1_aarch64-apple-darwin.tar.gz"
      sha256 "dec7dc870fbf37049fd83403a11adc496993124e3a4078441675941af71689f3"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.1/rms_memory_mcp_1.3.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0160051bd5a652e43a023530861a2aff771dadf87b86e34325727471fb17c0f6"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.1/rms_memory_mcp_1.3.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1edeea605508f9da70d0f0123c000e5bd9869b906a89c462fa7a23bc44b2db1c"
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
