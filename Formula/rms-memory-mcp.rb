class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.0.3" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.3/rms-memory-aarch64-apple-darwin.tar.gz"
      sha256 "099acba10ffc945485258a6c34e7a52d48eb5e1c24b577c3e45e8e81824f1221"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.3/rms-memory-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "374c5774303ef7294faef256d7126ad141168d88f412d78191eb744dd4f1a435"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.3/rms-memory-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d9877d25c4cf091a59d369889948d697e4143f6ea845a9a2f1abd410dd43fa5"
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
