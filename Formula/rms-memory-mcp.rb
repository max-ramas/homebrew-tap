class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.1.2" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.1.2/rms_memory_mcp_1.1.2_aarch64-apple-darwin.tar.gz"
      sha256 "2c4db1bd5969a0a14bad234a838c7476d1d416e8cba0d65e6a0a7ab04de9b974"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.1.2/rms_memory_mcp_1.1.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43d355e4cb5682a89f260f0f3348da38aad5b4d171accb30ee66af684ef73202"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.1.2/rms_memory_mcp_1.1.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ac174c278b4fbcdfd207b94be2c6befede0639414a470c7d9cff39b056a90cc"
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
