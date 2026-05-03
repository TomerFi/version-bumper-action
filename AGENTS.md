# Version Bumper Action

A GitHub Actions **composite action** wrapping [@tomerfi/version-bumper](https://github.com/TomerFi/version-bumper) for semantic version bumping based on conventional commits.

## Tech Stack

- **Runtime:** Bash inline scripts in `action.yml`
- **Package:** `@tomerfi/version-bumper` (pinned via `VB_VERSION` env var)
- **CI:** GitHub Actions workflows in `.github/workflows/`
- **Linting:** `actionlint` for workflow/action validation

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


