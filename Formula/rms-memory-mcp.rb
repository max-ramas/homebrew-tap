class RmsMemoryMcp < Formula
  desc "Persistent local-first memory MCP server for AI coding agents"
  homepage "https://github.com/max-ramas/rms-memory-mcp"
  version "1.4.3" # auto-updated by update-formula.yml — do not hand-edit
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.3/rms_memory_mcp_1.4.3_aarch64-apple-darwin.tar.gz"
      sha256 "c13b37a198262fcfb8a31c1bae674fddb1686e47776bbe6ac12e6ee5436e3a60"
    end
    on_intel do
      odie "rms-memory-mcp dropped macOS Intel (x86_64) builds as of v1.0.1. " \
           "Build from source: https://github.com/max-ramas/rms-memory-mcp#option-2-build-from-source"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.3/rms_memory_mcp_1.4.3_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3ae5b63a5f642b66fd8d46449f52ca013b964bcbd7c34821168e2845110ed49"
    end
    on_arm do
      url "https://github.com/max-ramas/rms-memory-mcp/releases/download/v1.4.3/rms_memory_mcp_1.4.3_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0930e80144d07344c719da21045cffdea651ec4e3491b41449413cb447cf132f"
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
