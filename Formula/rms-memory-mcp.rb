class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.2.1" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.1/rms_memory_mcp_1.2.1_aarch64-apple-darwin.tar.gz"
      sha256 "939237c43fc4cedc02e0f36f6d4603a2fcc13e986a2c91e38208d2cf585f9c7b"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.1/rms_memory_mcp_1.2.1_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ff508d051d420eddf8e70be35521ca9870c1937d5d059040fa6f540c79f64df"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.1/rms_memory_mcp_1.2.1_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4491482a2eae2c2787e51be74b81a76b13b7f5536a942df2abc6e89b533a0e3"
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
