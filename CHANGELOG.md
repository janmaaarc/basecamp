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
