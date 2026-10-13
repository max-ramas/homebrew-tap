class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.2.2" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.2/rms_memory_mcp_1.2.2_aarch64-apple-darwin.tar.gz"
      sha256 "1d0067ef00c3e6654ad5c11fd7e0ed61dc44e5e58faaeac895b29b6413c687d7"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.2/rms_memory_mcp_1.2.2_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65596cee2d00b8a6ae9892c31b192a25ccf97e6ab1fe6e1457ea506176aa104a"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.2.2/rms_memory_mcp_1.2.2_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51ef7816bf3e9c976017a243fe938dedd114726423177bcdfb9ad68927986a4d"
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
