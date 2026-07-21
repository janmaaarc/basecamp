@RTK.md
@rules/karpathy.md
@rules/ai-agents.md

# About You
- I build AI automation systems and full-stack web apps.
- Stack: Next.js, TypeScript, Python, Supabase, Node.js, n8n, OpenAI, Claude
- I value production-ready code over quick hacks.

# Your Defaults
- Package manager: npm
- Auth: Supabase Auth
- Styling: Tailwind CSS
- Deployment: Vercel
- Icons: Lucide

# Coding Rules

- Think before coding. Ask if unclear.
- Prefer simple over clever.
- No abstractions for single-use code.
- No external libraries unless nothing installed works.
- Follow the existing code style. Don't "improve" unrelated code.
- Comments: one line only. Explain why, not what. Example: `// retry here because Stripe webhooks fire twice on timeout`
- Markdown files: kebab-case names (e.g. my-notes.md).
- Watch for obvious bugs proactively.

# Git Rules

- Never commit or push unless I say so.
- Always review code before committing.
- Skip review only for docs/content-only changes under ~15 lines with zero code, config, dependency, or schema touched. Everything else gets reviewed, even if small.
- No "Co-Authored-By: Claude" in commits.
- Atomic commits. One change per commit.
- Never put passwords, API keys, or personal data in code.
- No WIP commits on main. Use a branch.
- Squash before merging. Keep history clean.

Commit format: `type(scope): short description`

- Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`
- Scope: optional, name of the area changed (auth, api, ui, db)
- Use imperative mood: `add` not `added`, `fix` not `fixed`
- Subject line: max 72 chars, no period at end
- Blank line between subject and body
- Body: explain why, not what
- Breaking change: add `!` after scope and `BREAKING CHANGE:` in footer
- Issue reference: `Closes #123` in footer
- Revert: `revert: feat(auth): add magic link login` with body `Reverts commit abc123.`

Branch naming: `type/short-description-kebab-case`

# Pull Requests

PR title: same format as commit subject — `type(scope): short description`

PR body:
```
## What
## Why
## How
## Test plan
## Notes
```

- Keep PRs small. One feature or fix per PR.
- Link issues: `Closes #123`
- Don't merge your own PR without review unless trivial.

# Error Handling

- Never hide errors. Always log with context.
- Validate inputs at system boundaries.
- Never trust raw AI output. Always validate structure.

# Testing

Write tests for: business logic, auth flows, AI pipelines, webhooks, migrations.
Skip tests for: UI, simple CRUD, one-off scripts, config files.
Don't write tests unless asked or it fits the above.
Keep tests next to the file they test by default. If a directory gets cluttered with many test files, move them into a dedicated test folder that mirrors the source structure (`tests/`, `__tests__/`, `src/test/`, `Tests/`, etc. depending on language). Flag the move before doing it.

# Project Memory (Obsidian)

Vault path: `~/Documents/my vault/`

At session start, Claude will:
1. Detect the project name from the current folder.
2. Find or create `my vault/Projects/<project-name>/`.
3. Read PROJECT.md, MISTAKES.md, and CONTRACT.md before doing anything.

- PROJECT.md — what this project is. Max 30 lines. Overwrite each session, no history.
- MISTAKES.md — mistakes to avoid. Add new ones, remove resolved ones.
- CONTRACT.md — plan for risky changes. Created before implementing, deleted after.

# High-Risk Changes

1. Research first. No code yet.
2. Write CONTRACT.md: what changes, why, risks, rollback plan, open questions.
3. Ask me questions. Wait for my approval.
4. Implement only after I approve.
5. I verify the result.

# Security Scans

- Before editing `.claude/settings.json`, `.claude/settings.local.json`, hooks, or MCP server config in any project: run `npx ecc-agentshield scan` first if not run recently. Not required for normal coding sessions.

# Known Tools (not installed by default)

- **code-review-graph** — codebase graph (MCP + CLI) for blast-radius/impact analysis on large or legacy repos: `pip install code-review-graph && code-review-graph install && code-review-graph build`. Only worth setting up once a project is big/tangled enough that "what calls this" means chasing callers across dozens of files. Suggest it when that describes the current project; don't install by default on small/greenfield ones.

# Writing Style

- No dashes as punctuation. Use periods, commas, or colons.
- No emojis.
- No "+" as a conjunction. Use "and" or "&".
- Direct and concise. No buzzwords.
