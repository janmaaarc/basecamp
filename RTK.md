# RTK - Rust Token Killer

> In Claude Code, all shell commands are transparently proxied through RTK via a hook. No action needed, RTK runs automatically in the background. In Codex, RTK is instruction-driven rather than hook-driven, so prefix commands with `rtk` as these instructions describe.

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

Claude Code, Cursor, Gemini CLI, Copilot, Factory Droid and Mistral Vibe get a hook processor that rewrites commands before they run. Codex works differently: `rtk init -g --codex` installs instructions into `AGENTS.md` and `RTK.md` instead of patching hooks, so the rewriting depends on the agent following those instructions rather than being intercepted. Check what a command becomes with `rtk rewrite "git status"`.
Example: `git status` → `rtk git status` (transparent, 0 tokens overhead)
No additional configuration needed.
