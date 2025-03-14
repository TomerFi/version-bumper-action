<div align="center">
<h1>Version Bumper Action</h1>
<h3>:package::rocket: Spice up your release workflows with automated version bumps! :rocket::package:</h3>
</div>

## About

The _Version Bumper Action_ uses the [version bumper tool][version-bumper] to figure out the next
[semantic version][semver] bump based on [conventional commits][conventional-commits], or plain instructions.

<details>
<summary>Upgrading from version 1 to 2? Click here.</summary>

<p>
Successful upgrades examples:
<a href="https://github.com/TomerFi/alexa-skills-tester/commit/d19bea17a197cd91f52aec6790e8558d409c7134">alexa-skills-tester</a>,
<a href="https://github.com/TomerFi/github-viewer-stats/commit/9f424642a9bb89b980e7a1b36ed2b10911ec2617">github-viewer-stats</a>,
<a href="https://github.com/TomerFi/auto-me-bot/commit/d7e9f1f9fc8fe42fa091585bd736e21e3ab39cab">auto-me-bot</a>,
<a href="https://github.com/TomerFi/tomfi-archetypes/commit/4cc89ea6c5f9ab63a95aef53d932a73b46f22412">tomfi-archetypes</a>,
<a href="https://github.com/TomerFi/shabbat-api/commit/50af0d1454814ce257ce36d63792236661158fe6">shabbat-api</a>,

</p>

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
</ul>
</details>

## Usage example

```yaml
- uses: actions/checkout@v2
  with:
    # fetch-depth 0 will check out all the commits and tags needed for the bumper
    fetch-depth: 0

- id: bumper
  uses: tomerfi/version-bumper-action@2.0.4

# assuming previous tag was 1.2.4 and feat-type commits were made, this will print 1.3.0.
- run: echo ${{ steps.bumper.outputs.next }}
```

### Inputs

| Key       | Description                                                                                   | Default value             |
|-----------|-----------------------------------------------------------------------------------------------|---------------------------|
| `source`  | Source for the bump, any semver string or 'git' to fetch from tags                            | `git`                     |
| `bump`    | Target bump, 'major', 'minor', 'patch', 'auto'. An 'auto' bump only works with a 'git' source | `auto`                    |
| `label`   | Development iteration build label                                                             | `-dev`                    |
| `path`    | When source is 'git', set repository path                                                     | `${{ github.workspace }}` |

### Outputs

| Key              | Description                                                                 | Example     |
|------------------|-----------------------------------------------------------------------------|-------------|
| `current`        | The original version                                                        | `1.2.3`     |
| `bump`           | The bump performed                                                          | `patch`     |
| `next`           | The next version                                                            | `1.2.4`     |
| `dev`            | The next development iteration version                                      | `1.2.5-dev` |
| `major_part`     | The major part of the next version                                          | `1`         |
| `minor_part`     | The minor part of the next version                                          | `2`         |
| `patch_part`     | The patch part of the next version                                          | `4`         |
| `dev_patch_part` | The patch part of the development iteration                                 | `5-dev`     |
| `bump_object`    | The original object returned from the [version bumper tool][version-bumper] |             |

<!-- Real links -->
[semver]: https://semver.org/
[conventional-commits]: https://conventionalcommits.org
[version-bumper]: https://github.com/TomerFi/version-bumper
