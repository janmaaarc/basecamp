#!/bin/bash
set -e

if [ ! -f "CLAUDE.md" ] || [ ! -f "setup.sh" ]; then
  echo "Error: Run this script from the basecamp repo root."
  exit 1
fi

# The review gate is opt-in because core.hooksPath is global and overrides every repo's
# .git/hooks, which would silently disable husky, lefthook or pre-commit if they are in use.
WITH_GATE=0
FORCE=0
VAULT=""
for arg in "$@"; do
  case "$arg" in
    --with-gate) WITH_GATE=1 ;;
    --force) FORCE=1 ;;
    --*) echo "Unknown option: $arg"; exit 1 ;;
    # Flags can come first, so the vault is the first non-flag argument, not $1.
    *) [ -z "$VAULT" ] && VAULT="$arg" ;;
  esac
done
VAULT="${VAULT:-$HOME/Documents/your-vault}"

# Never overwrite a file the user has edited. CLAUDE.md exists to be customized, so a second
# run of this script used to destroy that work silently. --force still replaces it, after
# keeping a .bak.
# Trimmed once here: bash 3.2, which macOS still ships, rejects a nested expansion inside a
# ${var/#pattern/repl} pattern with "bad substitution".
HOME_TRIMMED="${HOME%/}"

install_file() {
  local src="$1" dst="$2" shown
  shown="${dst/#$HOME_TRIMMED/~}"
  # A HOME ending in / makes the caller's ~/.claude/... expand with a doubled slash.
  shown="${shown//\/\///}"
  # A directory here would let the cp below succeed while writing the file *inside* it under
  # the source's own name, leaving the real target missing and nothing printed.
  if [ -d "$dst" ]; then
    echo "Error: $shown is a directory, expected a file. Move it aside and re-run." >&2
    return 1
  fi
  if [ -f "$dst" ] && ! cmp -s "$src" "$dst"; then
    if [ "$FORCE" = "1" ]; then
      cp "$dst" "$dst.bak"
      echo "  replaced $shown (previous version kept as $shown.bak)"
    else
      echo "  kept $shown, which differs from this repo's copy. Use --force to replace it."
      return 0
    fi
  fi
  cp "$src" "$dst"
}

if ! command -v claude &>/dev/null && ! command -v codex &>/dev/null; then
  echo "Error: Neither Claude Code nor Codex is installed."
  echo "  Claude Code: https://claude.ai/code"
  echo "  Codex:       https://github.com/openai/codex"
  exit 1
fi

echo "Setting up basecamp..."

# Core Claude files
mkdir -p ~/.claude/rules

# Substitute the vault placeholder BEFORE comparing, not after installing. Rewriting the
# installed file in place would leave it permanently different from this repo's copy, so every
# later run would report it as customized and refuse to update it.
CLAUDE_RENDERED=$(mktemp)
trap 'rm -f "$CLAUDE_RENDERED"' EXIT
perl -pe "s|\~/Documents/your-vault|$VAULT|g" CLAUDE.md > "$CLAUDE_RENDERED"
install_file "$CLAUDE_RENDERED" ~/.claude/CLAUDE.md

install_file RTK.md ~/.claude/RTK.md
for rule in rules/*.md; do
  install_file "$rule" ~/.claude/rules/"$(basename "$rule")"
done

# Obsidian templates. Same no-clobber rule: these get tailored per person too.
mkdir -p "$VAULT/Templates"
for tpl in Templates/*.md; do
  install_file "$tpl" "$VAULT/Templates/$(basename "$tpl")"
done

# Shared commands, on PATH so any agent and a plain shell can call them. These overwrite
# unconditionally, unlike CLAUDE.md and the templates: they are program code, so picking up
# fixes on a re-run is the point. Same reasoning for the git hooks below.
BIN="$HOME/.local/bin"
mkdir -p "$BIN"
cp bin/basecamp-reviewed bin/basecamp-sync-agents "$BIN/"
chmod +x "$BIN/basecamp-reviewed" "$BIN/basecamp-sync-agents"

# Codex reads AGENTS.md and cannot resolve CLAUDE.md's @imports, so generate a flattened copy.
# Only when Codex is actually present, so a Claude-only install does not grow a stray ~/.codex.
if command -v codex &>/dev/null || [ -d "$HOME/.codex" ]; then
  "$BIN/basecamp-sync-agents" ~/.claude/CLAUDE.md ~/.codex/AGENTS.md
else
  echo "Codex not detected. Run basecamp-sync-agents after installing it."
fi

# The review gate lives in git, not in one agent's hook system, so it applies to every agent.
if [ "$WITH_GATE" = "1" ]; then
  HOOKS_DIR="$HOME/.config/git/hooks"
  EXISTING=$(git config --global --get core.hooksPath || true)
  if [ -z "$EXISTING" ] || [ "$EXISTING" = "$HOOKS_DIR" ]; then
    mkdir -p "$HOOKS_DIR"
    cp hooks/pre-commit "$HOOKS_DIR/pre-commit"
    # A clean merge never invokes pre-commit, so the same script installs as pre-merge-commit
    # too. Without it a `git merge` with no conflicts lands unreviewed.
    cp hooks/pre-commit "$HOOKS_DIR/pre-merge-commit"
    chmod +x "$HOOKS_DIR/pre-commit" "$HOOKS_DIR/pre-merge-commit"
    git config --global core.hooksPath "$HOOKS_DIR"
    echo "Review gate installed at $HOOKS_DIR/{pre-commit,pre-merge-commit}"
  else
    echo "Skipped the review gate: core.hooksPath is already set to $EXISTING"
    echo "  Install by hand:"
    echo "    cp hooks/pre-commit \"$EXISTING/pre-commit\""
    echo "    cp hooks/pre-commit \"$EXISTING/pre-merge-commit\""
  fi
else
  echo "Review gate not installed. Add --with-gate to enable it."
fi

echo ""
echo "Done. Next steps:"
echo "  1. Open ~/.claude/CLAUDE.md and fill in your stack and defaults."
echo "  2. Re-run basecamp-sync-agents after editing it, so Codex sees the same rules."
echo "  3. Add $BIN to PATH if it is not already there."
echo "  4. Follow README.md to install RTK, Headroom, and agent plugins."
