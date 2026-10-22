#!/usr/bin/env bash
# InstructionsLoaded hook that logs which CLAUDE.md and rules files load and why, to prove paths: rules fire; always exits 0.

set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0

LOG="$HOME/.claude/state/instructions-loaded.jsonl"
mkdir -p "$(dirname "$LOG")"
jq -c --arg ts "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  '{ts: $ts, file: .file_path, reason: .load_reason, trigger: .trigger_file_path, project: (.cwd // "" | split("/") | last)}' \
  >> "$LOG" 2>/dev/null
exit 0
