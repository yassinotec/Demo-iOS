fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios screenshots

```sh
[bundle exec] fastlane ios screenshots
```

Generate new localized screenshots

### ios create_ios_app_online

```sh
[bundle exec] fastlane ios create_ios_app_online
```

Create iOS app online

### ios beta

```sh
[bundle exec] fastlane ios beta
```

Deploy Beta version of the app ...

### ios adhoc

```sh
[bundle exec] fastlane ios adhoc
```

Deploy Adhoc version of the app ...

### ios app_store

```sh
[bundle exec] fastlane ios app_store
```

Deploy App Store version of the app ...

### ios deploy_to_testflight

```sh
[bundle exec] fastlane ios deploy_to_testflight
```

Upload build to TestFlight ...

### ios slack_message

```sh
[bundle exec] fastlane ios slack_message
```

Slack to default channel

### ios slack_sandbox

```sh
[bundle exec] fastlane ios slack_sandbox
```

Slack to sandbox destination (for testing)

### ios generate_ipa_file

```sh
[bundle exec] fastlane ios generate_ipa_file
```

Generate .ipa file

### ios generate_app_file

```sh
[bundle exec] fastlane ios generate_app_file
```

Generate .app file

### ios generate_docs

```sh
[bundle exec] fastlane ios generate_docs
```

Generate documentation

### ios post_release

```sh
[bundle exec] fastlane ios post_release
```

Post release

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
