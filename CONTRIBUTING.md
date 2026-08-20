# Contributing to *version-bumper-action*

Thank you for contributing. This guide covers the essentials.

## AI Policy

This project has a clear AI policy — read [AI_POLICY.md](AI_POLICY.md) and follow it. You're responsible for everything you submit.

## Setup

```bash
git clone <repo-url>
cd version-bumper-action
```

See [AGENTS.md](AGENTS.md) for linting and testing commands.

## Local Checks

This project uses [**lefthook**](https://github.com/evilmartians/lefthook) for Git hooks. Install with `lefthook install`.

The pre-commit hook enforces:

- **Branch protection** — blocks commits directly to `master`
- **Workflow validation** — actionlint validates GitHub Actions workflows
- **EditorConfig** — editorconfig-checker enforces consistent file formatting
- **Assistant files** — aicfg keeps project instructions in sync; run `uvx aicfg link agents --to claude-code --ci` to link

```bash
# Auto-installed by `lefthook install`
# Runs automatically on every commit (unless on master, which is blocked)
```

To run checks manually against all files:

```bash
actionlint
editorconfig-checker
uvx aicfg link agents --to claude-code --ci
```

## Commit Style

- Conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`
- One logical change per commit

## PR Process

1. Branch from `master` with a conventional name: `feat/add-input`, `fix/bump-error`
2. Use a conventional PR title (`feat:`, `fix:`, `docs:`, etc.).
3. Commit with a descriptive message
4. Run all checks before submitting
5. Open PR with a clear description of what changed and why
6. Address feedback
