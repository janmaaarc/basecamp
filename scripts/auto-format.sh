#!/usr/bin/env bash
# PostToolUse hook that formats an edited file only with a formatter the project configures; never blocks, never installs.

set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0

FILE=$(cat | jq -r '.tool_input.file_path // empty' 2>/dev/null)
[ -n "$FILE" ] && [ -f "$FILE" ] || exit 0

DIR=$(dirname "$FILE")
ROOT=$(git -C "$DIR" rev-parse --show-toplevel 2>/dev/null) || exit 0

has_config() { compgen -G "$ROOT/$1" >/dev/null; }

case "$FILE" in
  *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.mts|*.cts|*.json|*.css|*.scss|*.html|*.vue|*.svelte|*.yml|*.yaml)
    # Defaults would reformat whole files in projects that never adopted prettier, so require its config.
    if [ -x "$ROOT/node_modules/.bin/prettier" ] && { has_config '.prettierrc*' || has_config 'prettier.config.*' || jq -e '.prettier' "$ROOT/package.json" >/dev/null 2>&1; }; then
      (cd "$ROOT" && node_modules/.bin/prettier --write "$FILE") >/dev/null 2>&1
    elif [ -x "$ROOT/node_modules/.bin/eslint" ] && { has_config 'eslint.config.*' || has_config '.eslintrc*'; }; then
      case "$FILE" in *.ts|*.tsx|*.js|*.jsx|*.mjs|*.cjs|*.mts|*.cts)
        (cd "$ROOT" && node_modules/.bin/eslint --fix --quiet "$FILE") >/dev/null 2>&1 ;;
      esac
    fi
    ;;
  *.py)
    if command -v ruff >/dev/null 2>&1 && { [ -f "$ROOT/ruff.toml" ] || [ -f "$ROOT/.ruff.toml" ] || grep -q '^\[tool\.ruff' "$ROOT/pyproject.toml" 2>/dev/null; }; then
      (cd "$ROOT" && ruff format --quiet "$FILE") >/dev/null 2>&1
    fi
    ;;
esac
exit 0
