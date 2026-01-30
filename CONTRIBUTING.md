# Contributing to *version-bumper-action*

:clap: First, thank you for taking the time to contribute. :clap:

## How to Contribute

- Fork the repository
- Create a new branch on your fork
- Commit your work following [Conventional Commits](https://conventionalcommits.org)
- Create a pull request against the `master` branch
- All PRs are squash merged, so your PR title becomes the commit message

## Conventional Commits

This project uses conventional commits, and **this is critical** because the action itself uses conventional commits to determine version bumps.

Use these prefixes:
- `feat:` - New feature (triggers minor bump)
- `fix:` - Bug fix (triggers patch bump)
- `docs:` - Documentation changes only
- `chore:` - Maintenance tasks, dependency updates
- `refactor:` - Code refactoring
- `test:` - Test changes

Breaking changes (major bump) should include `BREAKING CHANGE:` in the commit body.

## Testing

All changes are tested automatically via the `.github/workflows/test_action.yml` workflow. The test suite covers:
- Automatic version bumping (patch, minor, major)
- Manual version bumping
- Custom labels
- Output parsing

Tests run on every PR. Make sure they pass before requesting review.

## Local Development

### Linting

Validate action.yml and workflows locally before pushing:

```bash
actionlint
```

Install actionlint:
```bash
# macOS (Homebrew)
brew install actionlint

# Linux (download binary)
# See https://github.com/rhysd/actionlint/releases

# Or aqua
aqua g -i actionlint
```

## AI-Assisted Development

This project is configured for AI-assisted maintenance:

### CodeRabbit
- Automated code reviews on all PRs
- Reviews action.yml for shell script best practices and action structure
- Reviews workflows for security and efficiency
- Address review comments and use `@coderabbitai resolve` when fixed

### Cursor IDE
- **Project Rules:** See `.cursor/rules/project-rules.mdc` for project conventions
  - Bash scripting guidelines for inline scripts
  - Conventional commit requirements
  - Testing requirements
- **Commands:** See `.cursor/commands/` for available commands
  - `lint` - Run actionlint locally to validate action.yml and workflows

### Third-Party Tools
- **Dependabot:** Automatically updates GitHub Actions dependencies
- **actionlint:** Lints action.yml and workflow files in CI (validates YAML and inline shell scripts)

## Updating version-bumper Dependency

The action depends on the [@tomerfi/version-bumper](https://github.com/TomerFi/version-bumper) npm package. This is managed automatically:

- The `.github/workflows/new_version_bumper.yml` workflow detects new releases
- Automatically creates a PR with the updated version
- Simply review and merge the PR

Manual updates (if needed):
1. Update `VB_VERSION` in `action.yml`
2. Test via CI
3. Submit PR

## Project Maintenance

- PRs are reviewed by [@TomerFi](https://github.com/TomerFi) (see [CODEOWNERS](.github/CODEOWNERS))
- All PRs must pass CI checks before merging
- Keep the README usage example current (automated during releases)

