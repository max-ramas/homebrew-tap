class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.0.2" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.2/rms-memory-aarch64-apple-darwin.tar.gz"
      sha256 "5ef289b6ecc3da066dc5d4540da4ff467e749fdb4052ccf70799339369daacae"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.2/rms-memory-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "936aea54f765880831188817cd1b1153b1f2920e5906867690e6ad7e5d4621cb"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.0.2/rms-memory-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcc5a4c310317fa3156a598edf77f9bddd78d23243199fdb38afce97e088a552"
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
