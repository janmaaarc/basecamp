#!/bin/bash
set -e

if [ ! -f "CLAUDE.md" ] || [ ! -f "setup.sh" ]; then
  echo "Error: Run this script from the basecamp repo root."
  exit 1
fi

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

# Substitute vault path placeholder in CLAUDE.md
perl -pi -e "s|\~/Documents/your-vault|$VAULT|g" ~/.claude/CLAUDE.md

# Obsidian templates
mkdir -p "$VAULT/Templates"
cp -r Templates/ "$VAULT/Templates/"

echo ""
echo "Done. Next steps:"
echo "  1. Open ~/.claude/CLAUDE.md and fill in your stack and defaults."
echo "  2. Follow README.md to install RTK, Headroom, claude-mem, and Claude Code plugins."
