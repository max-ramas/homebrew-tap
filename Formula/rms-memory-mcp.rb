class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.0.5" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.5/rms-memory-aarch64-apple-darwin.tar.gz"
      sha256 "d8df268c46cbaeb8fd733d8f3f2d86c0bdc2bb85619b53b887f1dc7edc098e29"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.5/rms-memory-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0aeac417f977c6592e03f3b1f8966ad49435924059ad1f2d1582eb6e94ac7b8f"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.5/rms-memory-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13285bcb3aa4aa1c4546e0ad310be8395bf3a8320f9787a16bf322635898a336"
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
