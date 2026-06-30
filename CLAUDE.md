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

Examples:
```
feat(auth): add magic link login

Switches from password auth to magic links for better UX.
Closes #42

feat(api)!: replace session tokens with JWTs

BREAKING CHANGE: existing sessions invalidated on deploy.

revert: feat(auth): add magic link login

Reverts commit abc123.
```

Branch naming: `type/short-description-kebab-case`

```
feat/auth-magic-link
fix/api-null-response
chore/update-deps
```

# Pull Requests

PR title: same format as commit subject: `type(scope): short description`

PR body:
```
## What
One sentence. What changed.

## Why
One sentence. Why it was needed.

## How
Bullet points of key implementation decisions, if non-obvious.

## Test plan
How to verify this works. Steps to reproduce the before/after.

## Notes
Breaking changes, follow-ups, or anything reviewers should know.
```

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
