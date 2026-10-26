#!/usr/bin/env bash
# Stop hook that blocks ending a turn which edited code without a later typecheck, lint, build or test; fails open since it enforces workflow, not security.

set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0

INPUT=$(cat)

# Second stop after a nudge always passes, otherwise a repo with no gates would loop forever.
[ "$(printf '%s' "$INPUT" | jq -r '.stop_hook_active // false')" = "true" ] && exit 0

TRANSCRIPT=$(printf '%s' "$INPUT" | jq -r '.transcript_path // empty')
[ -n "$TRANSCRIPT" ] && [ -r "$TRANSCRIPT" ] || exit 0

# Anchored to a command start so words like "build" in `ls build/` or a commit message don't count as a gate.
VERIFY_RE='(^|[;&|(\n]|\$\()\s*(([A-Z_][A-Z0-9_]*=\S*|rtk|time|timeout \S+|uv run|poetry run|python3? -m|(npx|bunx|pnpm exec|pnpm dlx|yarn dlx|pnpm|yarn)( -\S+)*)\s+)*([./A-Za-z0-9_-]*/)?(tsc|eslint|biome|vitest|jest|pytest|ruff|mypy|pyright|xcodebuild|swift (build|test)|go (vet|test|build)|cargo (check|test|build|clippy)|make (test|lint|build|check|typecheck)|node --test|(npm|pnpm|yarn|bun)( --filter \S+| -\S+)* (run )?(-\S+ )*(t(?=\s|$)|(test|lint|build|typecheck|type-check|check)([:_-][A-Za-z0-9:_-]*)?))(\s|$|[;&|)])'

# One event per line: U = human prompt, E = code edit, V = verification command.
EVENTS=$(jq -r --arg verify "$VERIFY_RE" --arg home "$HOME" '
  def skipped: . == "" or startswith($home + "/.claude/") or startswith("/tmp/") or startswith("/private/tmp/") or test("\\.(md|mdx|txt|rst)$");
  if .type == "user" and .isMeta != true and (
      (.message.content | type) == "string"
      or ([.message.content[]? | select(.type == "text")] | length) > 0
    ) and ([.message.content[]? | select(.type == "tool_result")] | length) == 0
  then "U"
  elif .type == "assistant" then
    .message.content[]? | select(.type == "tool_use") |
    if (.name == "Edit" or .name == "Write" or .name == "MultiEdit" or .name == "NotebookEdit")
       and ((.input.file_path // .input.notebook_path // "") | skipped | not)
    then "E\t" + (.input.file_path // .input.notebook_path // "")
    elif .name == "Bash" and ((.input.command // "") | test($verify))
    then "V"
    else empty end
  else empty end
' "$TRANSCRIPT" 2>/dev/null) || exit 0

# Keep only events after the last human prompt, then check a V follows the last E.
TURN=$(printf '%s\n' "$EVENTS" | awk '/^U$/ {buf=""; next} {buf = buf $0 "\n"} END {printf "%s", buf}')
# Only edits inside a git work tree count as project code; dotfiles and app config have no gate to run.
TAB=$(printf '\t')
TURN=$(printf '%s\n' "$TURN" | while IFS= read -r line; do
  if [ "${line%%"$TAB"*}" = E ] && [ "$line" != E ]; then
    [ "$(git -C "$(dirname "${line#E"$TAB"}")" rev-parse --is-inside-work-tree 2>/dev/null)" = true ] && echo E
  elif [ -n "$line" ]; then
    echo "$line"
  fi
done)
printf '%s' "$TURN" | grep -q '^E$' || exit 0
printf '%s' "$TURN" | awk '/^E$/ {v=0} /^V$/ {v=1} END {exit v ? 0 : 1}' && exit 0

jq -n '{decision: "block", reason: "Done Means Verified: code was edited this turn but no typecheck, lint, build or test ran after the last edit. Run whichever of those the project has and report the result, or state plainly that the project has none."}'
exit 0
