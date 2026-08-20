# Version Bumper Action

A GitHub Actions **composite action** wrapping [@tomerfi/version-bumper](https://github.com/TomerFi/version-bumper) for semantic version bumping based on conventional commits.

## AI Policy

This project has an [AI policy](AI_POLICY.md). Always read it and ensure all suggestions, code, and contributions comply. If any behavior seems to conflict with the policy, warn the user and ask for guidance.

## Architecture

- `action.yml` — composite action entrypoint with inline bash scripts
- `.github/workflows/` — CI workflows (CI, test, release, new version bumper)
- `.github/workflows/test_action.yml` — reusable workflow for testing the action

## Working Environment

- This is a **GitHub Actions composite action** project.
- This project uses [**lefthook**](https://github.com/evilmartians/lefthook) for Git hooks. Install the hook with `lefthook install`.
- The pre-commit hook blocks commits to `master` and validates workflows with actionlint, editorconfig-checker, and aicfg.

## Linting

```bash
actionlint
editorconfig-checker
uvx aicfg link agents --to claude-code --ci
```

## Bash Scripting

Bash scripting conventions for action.yml inline scripts.

- Quote all variables: `"$variable"` not `$variable`
- Use `jq --raw-output` for JSON parsing
- Write outputs using `>> "$GITHUB_OUTPUT"` format
- Pin version-bumper package version in `VB_VERSION` env var

## Git and PR Conventions

Git and PR conventions for conventional commits and version bumping.

- **Conventional Commits:** Use `feat:`, `fix:`, `docs:`, `chore:`, etc.
- **PR Titles:** Use conventional commit format (becomes squash merge message)
- **Critical:** PR titles determine version bumps since this action uses conventional commits

## Testing

Testing conventions for the action's CI workflows.

- Test all functionality in `test_action.yml` workflow
- Test automatic and manual sources
- Test all bump types (major/minor/patch/auto)
