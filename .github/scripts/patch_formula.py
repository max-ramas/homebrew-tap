#!/usr/bin/env python3
"""
Patches a Homebrew formula's version/url/sha256 fields in place.
Called from .github/workflows/update-formula.yml as:
    python3 .github/scripts/patch_formula.py Formula/<name>.rb
Reads VERSION, DARWIN_URL, DARWIN_SHA, LINUX_X86_64_URL, LINUX_X86_64_SHA,
LINUX_ARM64_URL, LINUX_ARM64_SHA from the environment (set by the workflow).
"""
import os
import re
import sys


def replace_block(text: str, os_marker: str, arch_marker: str, url: str, sha: str) -> str:
    # Non-greedy search forward from os_marker to the *nearest* arch_marker
    # after it — correctly disambiguates on_linux/on_arm from the earlier
    # on_macos/on_arm block, since the search only looks forward.
    pattern = re.compile(
        rf'({os_marker}.*?{arch_marker}.*?url ")[^"]*(".*?sha256 ")[^"]*(")',
        re.DOTALL,
    )
    return pattern.sub(lambda m: m.group(1) + url + m.group(2) + sha + m.group(3), text, count=1)


def main() -> None:
    path = sys.argv[1]
    text = open(path).read()

    version = os.environ["VERSION"]
    text = re.sub(r'version "[^"]*"(\s*# auto-updated[^\n]*)', f'version "{version}"\\1', text)

    text = replace_block(text, r"on_macos do", r"on_arm do",
                          os.environ["DARWIN_URL"], os.environ["DARWIN_SHA"])
    text = replace_block(text, r"on_linux do", r"on_intel do",
                          os.environ["LINUX_X86_64_URL"], os.environ["LINUX_X86_64_SHA"])
    text = replace_block(text, r"on_linux do", r"on_arm do",
                          os.environ["LINUX_ARM64_URL"], os.environ["LINUX_ARM64_SHA"])

    open(path, "w").write(text)
    print(text)


if __name__ == "__main__":
    main()
