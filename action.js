const bumper = require('@tomerfi/version-bumper')
const core = require('@actions/core');

bumper({
  source: core.getInput('source'),
  bump: core.getInput('bumpoverride') || core.getInput('bump'),
  label: core.getInput('label'),
  path: core.getInput('folder') || core.getInput('path')
}).then(bump => {
  core.setOutput('current', bump.current)
  core.setOutput('bump', bump.bump)
  core.setOutput('next', bump.next)
  core.setOutput('dev', bump.dev)
  core.setOutput('bump_object', bump)
  // segregate semver parts
  let nextParts = bump.next.split('.')
  core.setOutput('major_part', nextParts[0])
  core.setOutput('minor_part', nextParts[1])
  core.setOutput('patch_part', nextParts[2])
  let devPatchPart = bump.dev.substring(bump.dev.indexOf('.', 2) + 1)
  core.setOutput('dev_patch_part', devPatchPart)
  // backward compatibility
  core.setOutput('new_version', bump.next)
  core.setOutput('next_dev_iteration', bump.dev)
  core.setOutput('patch_next_dev', devPatchPart)
}).catch(err => {
  core.error(err)
})
