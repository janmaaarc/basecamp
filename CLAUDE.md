<!-- Maintenance: add rules when a real mistake earns it (see MISTAKES.md), not by polishing in a vacuum. -->

@RTK.md
@rules/karpathy.md

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
- Use your chosen icon library. No emoji as icons.
- No inline styles. Use your CSS framework of choice.

# Coding Rules

- Keep files under 800 lines. At 800+, flag it and propose a split by responsibility (e.g. utils, hooks, sub-components) before adding more code. Never exceed 1,000 lines.
- No external libraries unless nothing installed works.
- Keep a `.env.example` with every required var (names only, no values). Never commit `.env`.
- Comments: one line only. Explain why, not what. Example: `// retry here because Stripe webhooks fire twice on timeout`
- Markdown files: kebab-case names (e.g. my-notes.md).
- Watch for obvious bugs proactively.

# Done Means Verified

- Before saying "done": run typecheck, lint, and build. Paste failures, do not hide them.
- Never claim something works without running it. "Should work" is not done.

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

PR title: same format as commit subject: `type(scope): short description`

PR body: sections What / Why / How / Test plan / Notes, one line each.

- Keep PRs small and focused. One feature or fix per PR.
- Link related issues: `Closes #123`
- Don't merge your own PR without review unless it's trivial.

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
<!-- Claude reads these files at the start of every session -->

Vault path: `~/Documents/your-vault/`
<!-- Replace above with your actual Obsidian vault path -->

At session start, Claude will:
1. Detect the project name from the current folder.
2. Find or create `your-vault/Projects/<project-name>/`.
3. Read PROJECT.md, MISTAKES.md, and CONTRACT.md before doing anything.

- PROJECT.md — what this project is. Max 30 lines. Overwrite each session, no history.
- MISTAKES.md — mistakes to avoid. Claude appends to it automatically when corrected. Remove resolved ones.
- CONTRACT.md — plan for risky changes. Created before implementing. Claude deletes it after the change is implemented and user verifies.

# High-Risk Changes
<!-- Applies to: migrations, auth, major refactors, breaking changes -->

1. Research first. No code yet.
2. Write CONTRACT.md: what changes, why, risks, rollback plan, open questions.
3. Ask me questions. Wait for my approval.
4. Implement only after I approve.
5. I verify the result.

# Writing Style

- Never use em dashes (— or --) as punctuation. Use periods, commas, or colons instead.
- No emojis.
- No "+" as a conjunction. Use "and" or "&".
- Direct and concise. No buzzwords.
