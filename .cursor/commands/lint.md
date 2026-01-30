---
description: Run actionlint to validate action.yml and workflows
---

# Lint Action and Workflows

Validates action.yml and all workflow files for syntax errors, shell script issues, and GitHub Actions best practices.

## Command

```bash
actionlint
```

## Prerequisites

Requires `actionlint` to be installed. See CONTRIBUTING.md for installation instructions.

## What it checks

- YAML syntax errors
- GitHub Actions workflow syntax
- Shell script issues in inline scripts (via shellcheck, if installed locally)
- Invalid action inputs/outputs
- Type mismatches in expressions
- Deprecated features

> **Note:** CI runs actionlint without shellcheck (`-shellcheck=` flag). CodeRabbit handles shell linting separately.
