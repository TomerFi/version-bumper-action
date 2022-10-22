# Contributing to *version-bumper-action*

:clap: First off, thank you for taking the time to contribute. :clap:

- Fork the repository
- Create a new branch on your fork
- Commit your work
- Create a pull request against the `master` branch

## Project walkthrough

This is a *Github Action* of type
[Docker container](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action),<br/>
it's based from the [version-bumper project](https://github.com/TomerFi/version-bumper) overwriting its entrypoint with
the [action.sh shell script](https://github.com/TomerFi/version-bumper-action/blob/master/action.sh),<br/>
the script is invoked by the *action* based on
[action.yml](https://github.com/TomerFi/version-bumper-action/blob/master/action.yml)
via a container based on the [Dockerfile](https://github.com/TomerFi/version-bumper-action/blob/master/Dockerfile),<br/>
[action.sh](https://github.com/TomerFi/version-bumper-action/blob/master/action.sh) invokes the overwritten
[entrypoint.sh](https://github.com/TomerFi/version-bumper/blob/master/entrypoint.sh) and parses its outcome as outputs
for the action.
