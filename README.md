# homebrew-tap

Maksim Ramzaev's shared Homebrew tap. One repo, one formula per open-source
project (rms-memory-mcp today; more later — rms-mail, etc.).

## Naming note

Homebrew requires the repo to be named `homebrew-<tapname>`. This repo is
`max-ramas/homebrew-tap`, so it's installed as:

```bash
brew tap max-ramas/tap
brew install rms-memory-mcp
# future projects: brew install rms-mail, etc. — same tap, no re-tapping
```

(If you'd genuinely rather it read `brew tap max-ramas/homebrew`, the repo
would need to be literally named `homebrew-homebrew` — works, but reads
oddly. `tap` as the catch-all name is the common convention for exactly
this "one tap, many formulas" setup.)

## How updates happen

Fully automatic, zero manual steps in normal operation. Each product repo's
own release CI fires a `repository_dispatch` at the end of its release
workflow; `.github/workflows/update-formula.yml` here picks it up, looks up
the real release assets via the GitHub API (never guesses filenames),
computes sha256, patches the right formula, commits, pushes.

See the comment block at the bottom of `update-formula.yml` for the
one-time, 6-line snippet to add to a product's `release.yml`, and the
`TAP_DISPATCH_TOKEN` secret it needs (one PAT, reused across all product
repos).

## Adding a new project to the tap

1. Copy `Formula/rms-memory-mcp.rb` as a template, adjust `desc`,
   `homepage`, binary name, and the platform matrix. Commit it once.
2. Add the dispatch snippet to that project's `release.yml` with its own
   `repo` / `formula` / `bin_name`.
3. Done — every future release updates itself.

## Manually triggering / backfilling

Only needed for first-time setup of a new formula or debugging a failed run:

```bash
gh workflow run update-formula.yml --repo max-ramas/homebrew-tap \
  -f repo=max-ramas/rms-memory-mcp \
  -f formula=rms-memory-mcp \
  -f bin_name=rms-memory \
  -f tag=v1.0.2
```
