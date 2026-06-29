#!/bin/bash
set -e

VAULT="${1:-$HOME/Documents/your-vault}"

if ! command -v claude &>/dev/null; then
  echo "Error: Claude Code is not installed. Install it from https://claude.ai/code"
  exit 1
fi

echo "Setting up basecamp..."

# Core Claude files
mkdir -p ~/.claude/rules
cp CLAUDE.md ~/.claude/CLAUDE.md
cp RTK.md ~/.claude/RTK.md
cp -r rules/ ~/.claude/rules/

# Obsidian templates
mkdir -p "$VAULT/Templates"
cp -r Templates/ "$VAULT/Templates/"

echo ""
echo "Done. Two steps left:"
echo "  1. Open ~/.claude/CLAUDE.md and fill in your stack, vault path, and defaults."
echo "  2. Follow README.md to install RTK, Headroom, claude-mem, and Claude Code plugins."
