<!-- Maintenance: add rules when a real mistake earns it (see MISTAKES.md), not by polishing in a vacuum. -->

@RTK.md
@rules/karpathy.md
@rules/security.md

> Rule priority: security rules override simplicity rules. When they conflict, default to the secure choice.

# About You
<!-- Tell Claude who you are and what you build -->
- I build [e.g. AI agents, web apps, automation tools]
- Stack: [e.g. Next.js, Python, Supabase, Node.js]
- I value production-ready code over quick hacks.

# Your Defaults
<!-- Set your go-to tools so Claude never guesses -->
- Package manager: [npm / pnpm / yarn / pip]
- Auth: [Supabase Auth / Clerk / NextAuth]
- Styling: [Tailwind / CSS Modules]
- Deployment: [Vercel / Railway / Fly.io]
- Icons: [Lucide / Heroicons]

# Frontend
<!-- Remove if not building UI -->
- Run `/impeccable audit` and `/impeccable polish` before shipping any UI. (Requires the impeccable plugin — remove this line if not installed.)
- No inline styles. Use your CSS framework of choice.

# Coding Rules

- Keep files modular.
- Keep files under 800 lines. At 800+, flag it and propose a split by responsibility (e.g. utils, hooks, sub-components) before adding more code. Never exceed 1,000 lines.
- Never introduce breaking changes without explaining why.
- No external libraries unless nothing installed works.
- Use the project dependency file for correct versions. Never assume latest.
- Keep a `.env.example` with every required var (names only, no values). Add, edit, or remove vars there whenever code changes require it, no need to ask each time. Never commit `.env`. If a project's `.gitignore` has a blanket `.env*` rule, add `!.env.example` so the template itself isn't excluded.
- Comments: one line only. Explain why, not what. Example: `// retry here because Stripe webhooks fire twice on timeout`
- Markdown files: kebab-case names (e.g. my-notes.md). Conventional root and meta docs keep their established uppercase names: `README.md`, `CHANGELOG.md`, `CLAUDE.md`, `LICENSE`, and the project memory files (`PROJECT.md`, `MISTAKES.md`, `CONTRACT.md`, `REQUIREMENTS.md`).
- Watch for obvious bugs proactively.
- When sweeping for a pattern, enumerate the full set present and diff against the allowed set. Don't grep only for instances already suspected.

# Done Means Verified

- Before saying "done": run typecheck, lint, and build. Paste failures, do not hide them.
- Never claim something works without running it. "Should work" is not done.
- Rendering or screenshotting a screen is not exercising it. Press anything with a handler.
- A tool's reported success is a claim, not an observation. Assert the state you asked for in the same call.
- Run final gates and `git status --porcelain` last, after the final edit.

# Git Rules

- Never commit or push unless I say so.
- Always review code before committing.
- Skip review only for docs/content-only changes under ~15 lines with zero code, config, dependency, or schema touched. Everything else gets reviewed, even if small.
- No "Co-Authored-By: Claude" in commits.
- Atomic commits. One change per commit.
- Never put passwords, API keys, or personal data in code.
- No WIP commits on main. Use a branch.
- Squash before merging. Keep history clean.
- After staging broadly for review, `git reset` before staging each logical commit. `git add -A <path>` does not limit the index to `<path>`.
- After a merge conflict, diff against the branch you merged from. An unused import surviving resolution usually means a dropped feature, not just a lint warning.

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

PR title: same format as commit subject: `type(scope): short description`

PR body: sections What / Why / How / Test plan / Notes, one line each.

- Keep PRs small and focused. One feature or fix per PR.
- Link related issues: `Closes #123`
- Don't merge your own PR without review unless it's trivial.

# Error Handling

- Never hide errors. Always log with context.
- Validate inputs at system boundaries.
- Never trust raw AI output. Always validate structure.
- Use typed error objects, not raw strings.
- JS/TS only, remove on other stacks: `void somePromise()` silences the lint rule, not the rejection. Attach `.catch()` if a rejection is expected.

# Testing

Write tests for: business logic, auth flows, AI pipelines, webhooks, migrations.
Skip tests for: UI, simple CRUD, one-off scripts, config files.
Don't write tests unless asked or it fits the above.
Keep tests next to the file they test by default. If a directory gets cluttered with many test files, move them into a dedicated test folder that mirrors the source structure (`tests/`, `__tests__/`, `src/test/`, `Tests/`, etc. depending on language). Flag the move before doing it.

- Test behavior, not implementation. Tests should break when behavior breaks, not when code is refactored.
- One test file per module.
- Check a passing test can still fail on the alternate case. "Expect absent/empty" assertions pass easiest for the wrong reason.
- A test failing only inside the full suite may be polluted by a prior test, not flaky. Bisect by name.

# Project Memory (Obsidian)
<!-- Claude reads these files at the start of every session -->

Vault path: `~/Documents/your-vault/`
<!-- Replace above with your actual Obsidian vault path -->

At session start, Claude will:
1. Detect the project name from the current folder.
2. Find or create `your-vault/Projects/<project-name>/`.
3. Read PROJECT.md, MISTAKES.md, CONTRACT.md, DECISIONS.md, DEBT.md, and REQUIREMENTS.md before doing anything.

- PROJECT.md — what this project is. Max 30 lines. Overwrite each session, no history. Verify status claims (test counts, branch state) against the repo, don't carry forward assumptions from earlier in the conversation.
- MISTAKES.md — mistakes to avoid. Claude appends to it automatically when corrected. Remove resolved ones.
- CONTRACT.md — plan for risky changes. Created before implementing. Claude deletes it after the change is implemented and user verifies. If one already exists at session start, check whether its change already landed (`git log`) before treating it as open.
- DECISIONS.md — durable "why we chose X over Y" calls that would otherwise be lost when PROJECT.md gets overwritten. Append, don't overwrite.
- DEBT.md — known gaps, consciously deferred, not yet mistakes. Append, don't overwrite. Close an item by moving it to a "Closed" section with the outcome, don't delete it outright.
- REQUIREMENTS.md — per-project checklist filtered from `Templates/REQUIREMENTS.md` by the project's `type` (see that file's header for generation rules). Check at session start, flag unchecked 🔴 High items before calling work "done", mark `- [x]` only on user confirmation, not Claude's own say-so.

# High-Risk Changes
<!-- Applies to: migrations, auth, major refactors, breaking changes -->

1. Research first. No code yet.
2. Write CONTRACT.md: what changes, why, risks, rollback plan, open questions.
3. Ask me questions. Wait for my approval.
4. Implement only after I approve.
5. I verify the result.

# Security Scans
<!-- Requires the agentshield tool (npx ecc-agentshield) — remove this line if not using it. -->

- Before editing `.claude/settings.json`, `.claude/settings.local.json`, hooks, or MCP server config in any project: run `npx ecc-agentshield scan` first if not run recently. Not required for normal coding sessions.

# Known Tools (not installed by default)
<!-- Optional tools worth knowing about but not part of the default setup. Add your own as you find them. -->

- **code-review-graph** — codebase graph (MCP + CLI) for blast-radius/impact analysis on large or legacy repos: `pip install code-review-graph && code-review-graph install && code-review-graph build`. Only worth setting up once a project is big/tangled enough that "what calls this" means chasing callers across dozens of files. Suggest it when that describes the current project; don't install by default on small/greenfield ones.

# Responses

- Be concise. Don't over-explain unless asked.
- Recommend best practices. Point out trade-offs.
- Challenge assumptions when appropriate.

# Writing Style

- Never use em dashes (— or --) or en dashes (–) as punctuation in prose. Use periods, commas, or colons instead. `|` is fine for compact separators (legends, key lists, web titles like "Page Name | Site Name"). A single hyphen (`-`) stays fine for ranges ($100-$200) and compound modifiers (one-handed), but not as a stand-in pause/interruption ("I like this - not that") since that's the same banned punctuation in disguise.
- Use clear, direct language.
- Avoid buzzwords and unnecessary fluff.
- Don't exaggerate capabilities.
- Prioritize accuracy over sounding impressive.
- Never use emojis in responses or code.
- Never use "+" as a conjunction. Use "and" or "&" instead.

# UI Icons

- Use one icon library consistently, the one set in Your Defaults.
- No emoji as icons, no mixing icon libraries unless the project specifies.
- Never add border highlights on UI borders.
