## v1.7.0: 2026-07-22

### Changed
- CLAUDE.md, CLAUDE.example.md: .env.example rule now allows adding/editing/removing vars freely as code changes, plus a gitignore exception note (!.env.example) for projects with a blanket .env* ignore rule

### Added
- CLAUDE.md, CLAUDE.example.md: Known Tools section documenting code-review-graph as an optional, not-installed-by-default tool
- README.md: agentshield setup snippet and Tools table row

### Added
- CLAUDE.md, CLAUDE.example.md: Security Scans section, run agentshield before editing .claude/ config

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
