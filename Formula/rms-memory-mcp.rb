class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.3.0" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.0/rms_memory_mcp_1.3.0_aarch64-apple-darwin.tar.gz"
      sha256 "ec7deb2531ddb1db19f94a5fe5028ce43b98f58c6c6cd28d5b73cdeedddb7cf7"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.0/rms_memory_mcp_1.3.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd1ec49281a8f4ef71074ada209ff820ccbfa2ed554ef048f59954541b2665a3"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.3.0/rms_memory_mcp_1.3.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aaaa7cca62677a3edc08ae1358b8c2b62f96e30ea2410aa0e7a1654b08d0a7ae"
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
