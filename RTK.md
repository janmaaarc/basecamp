# RTK - Rust Token Killer

> In Claude Code, all shell commands are transparently proxied through RTK via a hook. No action needed, RTK runs automatically in the background. In Codex there is no such hook, so prefix commands with `rtk` yourself.

**Usage**: Token-optimized CLI proxy (60-90% savings on dev operations)

## Meta Commands (always use rtk directly)

```bash
rtk gain              # Show token savings analytics
rtk gain --history    # Show command usage history with savings
rtk discover          # Analyze Claude Code history for missed opportunities
rtk proxy <cmd>       # Execute raw command without filtering (for debugging)
```

## Installation Verification

```bash
rtk --version         # Should show: rtk X.Y.Z
rtk gain              # Should work (not "command not found")
which rtk             # Verify correct binary
```

**Name collision**: If `rtk gain` fails, you may have reachingforthejack/rtk (Rust Type Kit) installed instead.

## Hook-Based Usage

All other commands are automatically rewritten by the agent's hook.

RTK ships hook processors for Claude Code, Cursor, Gemini CLI, Copilot, Factory Droid and Mistral Vibe. There is no Codex processor, so **in Codex the rewriting is not automatic**. Call `rtk` yourself (`rtk git status`, `rtk grep ...`), or check what a command would become with `rtk rewrite "git status"`.
Example: `git status` → `rtk git status` (transparent, 0 tokens overhead)
No additional configuration needed.
