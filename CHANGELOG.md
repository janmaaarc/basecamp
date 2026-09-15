## v1.10.0: 2026-09-15


### Added
- Codex support: `setup.sh` generates `~/.codex/AGENTS.md` and no longer requires Claude Code, accepting either agent
- `bin/basecamp-sync-agents`: flattens the `@rules/*.md` imports in `CLAUDE.md` into `AGENTS.md`, which Codex cannot resolve on its own
- `hooks/pre-commit`: opt-in review gate (`setup.sh --with-gate`) installed via `core.hooksPath`, so it applies to Claude Code, Codex, an IDE and a plain terminal alike
- `bin/basecamp-reviewed`: records a reviewed staged diff, unblocking the gate for any agent
- `AGENTS.md` checked in, generated from `CLAUDE.md`, so Codex users get the rules on clone without running setup
- `.github/workflows/agents-sync.yml`: fails a PR when `AGENTS.md` no longer matches `CLAUDE.md`
- README: "Switching Between Claude Code and Codex" covering what is shared, with per-agent install commands for ECC, ponytail, caveman, pg-aiguide and impeccable
- README: step 5 of Setup covers installing for Codex
- RTK.md: notes that RTK has no Codex hook processor, so its rewriting is manual there
- CLAUDE.md, CLAUDE.example.md: agentshield scan list includes `~/.codex/config.toml`
- Issue template asks which agent, not just the Claude Code version

### Changed
- README: described as a setup for Claude Code and Codex rather than Claude Code alone
- README: Tools table gains a Codex column, replacing the implicit assumption that every tool was Claude Code only
- README: plugin updates documented as uninstall then install, because `marketplace update` refreshes the cache without switching the active version
- CLAUDE.md, Templates: wording that named Claude directly now says "the agent"

### Fixed
- `setup.sh` parses the vault path as the first non-flag argument, so `setup.sh --with-gate` no longer treats the flag as a vault directory. Unknown options now fail instead of being silently ignored.
- `basecamp-sync-agents` keeps the last line of a file that has no trailing newline, and strips `\r` so a CRLF checkout still resolves `@` imports instead of emitting the raw line
- The gate installs as `pre-merge-commit` as well as `pre-commit`, because a merge with no conflicts never invokes `pre-commit` and would otherwise land unreviewed

### Notes
- The gate keys on a hash of the reviewed diff rather than file mtimes, so an edit made in the same second as the review still re-arms it
- The gate is opt-in because `core.hooksPath` is global and overrides every repository's `.git/hooks`, which would silently disable husky, lefthook or pre-commit
- `setup.sh` leaves an existing `core.hooksPath` untouched and prints manual install instructions instead of redirecting it



## v1.9.0: 2026-08-11

### Added
- CLAUDE.md, CLAUDE.example.md: Done Means Verified expanded (screenshotting is not exercising, a tool's reported success is a claim, run final gates and `git status --porcelain` last)
- CLAUDE.md, CLAUDE.example.md: Responses and UI Icons sections
- CLAUDE.md, CLAUDE.example.md: DECISIONS.md and DEBT.md added to project memory, plus a stale-CONTRACT check and PROJECT.md status verification
- Git Rules: `git add -A <path>` staging trap, merge-conflict dropped-feature check
- Testing: behavior over implementation, alternate-case check, suite-pollution bisect, one test file per module
- Error Handling: typed error objects, unhandled promise rejection
- Coding Rules: pattern-sweep completeness, dependency-file versions, no silent breaking changes, keep files modular
- rules/typescript.md: never widen a union to bare `string`
- rules/ai-agents.md: never embed credentials in workflow or agent config
- RTK.md: hook-proxy note and name-collision warning

### Changed
- CLAUDE.md now imports `rules/security.md`, which shipped but was never wired up, plus the security-over-simplicity priority line
- Writing Style mirrors the full rule set: clear language, no exaggeration, accuracy over sounding impressive
- Kebab-case rule now exempts conventional uppercase docs (README.md, CHANGELOG.md, CLAUDE.md, LICENSE, project memory files)

## v1.8.1: 2026-08-03

### Changed
- Writing Style: dash ban now explicitly covers en dashes and a lone hyphen used as a sentence pause. Ranges ($100-$200) and compound modifiers (one-handed) stay allowed

### Fixed
- Release workflow: stop deleting the previous version heading when prepending a new CHANGELOG entry
- CHANGELOG: restore the missing v1.5.0, v1.6.0, and v1.7.0 sections

## v1.8.0: 2026-07-26

### Added
- Templates/REQUIREMENTS.md: master requirements checklist (auth, security, SEO, AI/LLM, DevOps, email deliverability, client handoff) filtered per project by a new Type field (landing/app/saas/api/automation)
- PROJECT.md: Type field and REQUIREMENTS.md link
- CLAUDE.md, CLAUDE.example.md: REQUIREMENTS.md added to session-start file reads

### Changed
- Writing Style: no-em-dash rule now allows | as a compact separator in legends, key lists, and web titles

## v1.7.0: 2026-07-22

### Changed
- CLAUDE.md, CLAUDE.example.md: .env.example rule now allows adding/editing/removing vars freely as code changes, plus a gitignore exception note (!.env.example) for projects with a blanket .env* ignore rule

## v1.6.0: 2026-07-21

### Added
- CLAUDE.md, CLAUDE.example.md: Known Tools section documenting code-review-graph as an optional, not-installed-by-default tool
- README.md: agentshield setup snippet and Tools table row
- README.md: agentshield in the feature list

## v1.5.0: 2026-07-21

### Added
- CLAUDE.md, CLAUDE.example.md: Security Scans section, run agentshield before editing .claude/ config

### Fixed
- Release workflow: checkout main instead of a detached HEAD
- Release workflow: stop interpolating the release body into the shell script

## v1.4.0: 2026-07-21

### Added
- CLAUDE.md, CLAUDE.example.md: test-folder rule for cluttered test directories
- CLAUDE.md, CLAUDE.example.md: skip-review threshold for small docs/content-only commits

## v1.3.0: 2026-06-30

### Added
- rules/typescript.md, rules/security.md, rules/mobile.md
- FAQ section in README
- setup.sh: repo root check and vault path auto-substitution
- CLAUDE.md: Frontend section with impeccable, security priority rule, clarified git commit sequence
- impeccable plugin to tools table and install steps

### Fixed
- Removed invalid `brew trust` command from README
- Fixed em dash in PR title format
- Fixed empty Open Questions in CONTRACT.md template

## v1.2.0: 2026-06-29

### Added
- rules/typescript.md, rules/security.md, rules/mobile.md
- FAQ section in README
- Star history placeholder in README

## v1.1.0: 2026-06-29

### Added
- Conventional commits spec, branch naming, PR format
- Obsidian screenshots to README
- MIT LICENSE

## v1.0.0: 2026-06-29

### Added
- CLAUDE.md: generic global Claude Code instructions
- CLAUDE.example.md: filled-in reference example
- RTK.md: RTK token killer setup
- rules/karpathy.md: Karpathy coding principles
- rules/security.md: security rules
- rules/ai-agents.md, rules/web.md, rules/data.md: stack-specific rules
- Templates/PROJECT.md, Templates/MISTAKES.md, Templates/CONTRACT.md
- setup.sh: one-command install
- GitHub Action: auto-update CHANGELOG on release
