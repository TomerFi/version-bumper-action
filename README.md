:package::rocket: Spice up your release workflow with automated version bumps! :rocket::package:</br>

## About

The _Version Bumper Action_ can help you figure out your next [semantic version][semver] bump based on
[conventional commits][conventional-commits], or plain instructions.

<details>
<summary>Upgrading from version 1 to 2? Click here.</summary>

<h3>Version 3 introduced breaking changes</h3>
<ul>

<li>The action was rebuilt using Node.js.</li>

<li>
Changes in the action flags:
  <ul>
  <li><strong>changelog</strong> was removed.</li>
  <li><strong>preset</strong> was removed.</li>
  <li><strong>folder</strong> was changed to <strong>path</strong>. It's worth mentioning the folder/path requires a
    full path and not a folder relative to the workspace. (<em>folder</em> will eventually be removed).</li>
  <li><strong>bumpoverride</strong> was changed to <strong>bump</strong> (<em>bumpoverride</em> will eventually be removed).
  </li>
  </ul>
</li>
<br/>

</ul>
</details>

## Usage example

```yaml
- uses: actions/checkout@v2
  with:
    # fetch-depth 0 will check out all the commits and tags needed for the bumper
    fetch-depth: 0

- id: bumper
  uses: tomerfi/version-bumper-action@1.2.2

# assuming previous tag was 1.2.4 and feat-type commits were made, this will print 1.3.0.
- run: echo ${{ steps.bumper.outputs.next }}
```

### Inputs

| Key       | Description                                                                                    | Default value             |
|-----------|------------------------------------------------------------------------------------------------|---------------------------|
| `source`  | Source for the bump, any semver string or 'git' to fetch from tags.                            | `git`                     |
| `bump`    | Target bump, 'major', 'minor', 'patch', 'auto'. An 'auto' bump only works with a 'git' source. | `auto`                    |
| `label`   | Development iteration build label.                                                             | `-dev`                    |
| `path`    | When source is 'git', set folder in the git.                                                   | `${{ github.workspace }}` |

### Outputs

| Key              | Description                                                | Example     |
|------------------|------------------------------------------------------------|-------------|
| `current`        | The original version.                                      | `1.2.3`     |
| `bump`           | The bump performed.                                        | `patch`     |
| `next`           | The next version.                                          | `1.2.4`     |
| `dev`            | The next development iteration version.                    | `1.2.5-dev` |
| `major_part`     | The major part of the next version.                        | `1`         |
| `minor_part`     | The minor part of the next version.                        | `2`         |
| `patch_part`     | The patch part of the next version.                        | `4`         |
| `dev_patch_part` | The patch part of the development iteration.               | `5-dev`     |
| `bump_object`    | The original object returned from the version-bumper tool. |             |


## Contributors [![all-contributors-badge]][all-contributors]

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/MisterTimn"><img src="https://avatars.githubusercontent.com/u/4209558?v=4?s=100" width="100px;" alt="Jasper Vaneessen"/><br /><sub><b>Jasper Vaneessen</b></sub></a><br /><a href="https://github.com/TomerFi/version-bumper-action/commits?author=MisterTimn" title="Code">💻</a> <a href="https://github.com/TomerFi/version-bumper-action/commits?author=MisterTimn" title="Documentation">📖</a></td>
      <td align="center"><a href="https://gsoftwarelab.com"><img src="https://avatars.githubusercontent.com/u/9322695?v=4?s=100" width="100px;" alt="Lucas Schmutzler"/><br /><sub><b>Lucas Schmutzler</b></sub></a><br /><a href="https://github.com/TomerFi/version-bumper-action/commits?author=g4m3r0" title="Code">💻</a></td>
      <td align="center"><a href="https://github.com/mrdoodles"><img src="https://avatars.githubusercontent.com/u/19146299?v=4?s=100" width="100px;" alt="mrdoodles"/><br /><sub><b>mrdoodles</b></sub></a><br /><a href="https://github.com/TomerFi/version-bumper-action/commits?author=mrdoodles" title="Code">💻</a> <a href="https://github.com/TomerFi/version-bumper-action/commits?author=mrdoodles" title="Documentation">📖</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

<!-- Real links -->
[semver]: https://semver.org/
[conventional-commits]: https://conventionalcommits.org
[all-contributors]: https://allcontributors.org/
<!-- Badge links -->
[all-contributors-badge]: https://img.shields.io/github/all-contributors/tomerfi/version-bumper-action?style=plastic&label=%20&color=b7b1e3

