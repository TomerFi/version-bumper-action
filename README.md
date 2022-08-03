# Version Bumper Action</br>[![gh-build-status]][0]

:package::rocket: Spice up your release workflow with automated version bumps! :rocket::package:</br>

This action encapsulates [Version Bumper][1] for determining the next semantic version,</br>
based on the [semantic tags][2] and [conventional commits][3] in your git repository.

## Minimal usage example

```yaml
- name: Checkout sources
  uses: actions/checkout@v2
  with:
    # fetch-depth 0 will check out all the commits and tags needed for the bumper
    fetch-depth: 0

- name: Run bumper
  id: bumper
  uses: tomerfi/version-bumper-action@1.1.3
```

## Parse outputs

If the latest [semantic tag][2], in your git repository is, for instance, `2.1.6`.</br>
The following table illustrates the outcome based on the required bump,</br>
identified from [commit messages][3]:

| Bump  | new_version | next_dev_iteration | changelog filename |
| :---- | :---------: | :----------------: | :----------------- |
| major |    3.0.0    |     3.0.1.dev      | changelog-3.0.0.md |
| minor |    2.2.0    |     2.2.1.dev      | changelog-2.2.0.md |
| patch |    2.1.7    |     2.1.8.dev      | changelog-2.1.7.md |

## Full usage example

```yaml
- name: Checkout sources
  uses: actions/checkout@v2
  with:
    # fetch-depth 0 will check out all the commits and tags needed for the bumper
    fetch-depth: 0

- name: Run bumper
  id: bumper
  uses: tomerfi/version-bumper-action@1.1.3
  with:
    label: .dev
    changelog: true
    preset: conventionalcommits
    folder: ./
    bumpoverride: auto
```

## Inputs

| Key             | Description                                             | Default value         |
| --------------- | ------------------------------------------------------- | --------------------- |
| `label`         | Build label for the development iteration               | `.dev`                |
| `changelog`     | Set true to create a changelog-X.md file                | `false`               |
| `preset`        | Preset for creating the changelog                       | `conventionalcommits` |
| `folder`        | Folder in the workspace in which the .git repo resides  | `./`                  |
| `bumpoverride`  | Override the version bump, can be either `auto`, `major`, `minor` or `patch`  | `auto` |

> Tip: other than `conventionalcommits`, possible prest values can be found [here][4].

## Outputs

| Key                  | Description                                 | Example     |
| -------------------- | ------------------------------------------- | ----------- |
| `new_version`        | The next semantic version                   | `1.2.3`     |
| `next_dev_iteration` | The next development iteration              | `1.2.4.dev` |
| `major_part`         | The major part of the next version          | `1`         |
| `minor_part`         | The minor part of the next version          | `2`         |
| `patch_part`         | The patch part of the next version          | `3`         |
| `patch_next_dev`     | The patch part of the development iteration | `4.dev`     |

> If `changelog` is set to `true`, a file named `changelog-1.2.3.md` will be created,</br>
> from which you can source your release notes or updated your changelog.

## Contributors

<!-- editorconfig-checker-disable -->
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/mrdoodles"><img src="https://avatars.githubusercontent.com/u/19146299?v=4?s=100" width="100px;" alt=""/><br /><sub><b>mrdoodles</b></sub></a><br /><a href="https://github.com/TomerFi/version-bumper-action/commits?author=mrdoodles" title="Code">💻</a> <a href="https://github.com/TomerFi/version-bumper-action/commits?author=mrdoodles" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
<!-- editorconfig-checker-enable -->

## Example workflows

Here are a couple of projects of mine, using this action:

- [aioswitcher (python)][5]
- [switcher_webapi (docker, coordinated with a text file)][6]
- [alexa-skills-tester (java)][7]
- [auto-me-bot (javascript)][8]
- [this action eats its own dogfood (docker based action)][9]

<!-- editorconfig-checker-disable -->
<!-- Real links -->

[0]: https://github.com/TomerFi/version-bumper-action/actions/workflows/stage.yml
[1]: https://hub.docker.com/r/tomerfi/version-bumper
[2]: https://semver.org/
[3]: https://conventionalcommits.org
[4]: https://github.com/conventional-changelog/conventional-changelog/blob/master/packages/conventional-changelog-cli/cli.js
[5]: https://github.com/TomerFi/aioswitcher/blob/dev/.github/workflows/release.yml
[6]: https://github.com/TomerFi/switcher_webapi/blob/dev/.github/workflows/release.yml
[7]: https://github.com/TomerFi/alexa-skills-tester/blob/master/.github/workflows/release.yml
[8]: https://github.com/TomerFi/auto-me-bot/blob/master/.github/workflows/release.yml
[9]: https://github.com/TomerFi/version-bumper-action/blob/master/.github/workflows/release.yml

<!-- Badge links -->

[conventional-commits]: https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg
[gh-build-status]: https://github.com/TomerFi/version-bumper-action/actions/workflows/stage.yml/badge.svg

<!-- editorconfig-checker-enable -->
