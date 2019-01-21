As I mentioned in the channel, I've had a few issues getting `vagrant up` to complete. One of them is the npm install issues I mentioned at https://gitter.im/coddingtonbear/inthe.am?at=5c2be1816649aa1f82060e20

This upgrades some npm packages to allow them to install successfully. One of the dependencies of `ember-cli` wasn't installing - I can't remember which one exactly. This is the earliest version of `ember-cli` which removes bower (deprecated) under the hood.

Ultimately I wanted to make a PR for https://github.com/coddingtonbear/inthe.am/issues/305#issuecomment-450627761 and ended up doing so, but I want to get the development environment running from master before I do that.

Everything seems to run OK, but I wonder if an `ember-cli` which is different from the `ember` version (in bower.json) could cause issues? I don't use ember for any of my projects.