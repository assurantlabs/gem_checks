# This repo has been moved to gitlab

https://gitlab.management-eks.us-east-1.assurantlabs.com/general/gem_checks

`git remote set-url origin git@gitlab-ssh.management-eks.us-east-1.assurantlabs.com:general/gem_checks.git`

# Gem Checks
[![Code Climate](https://codeclimate.com/github/mobiledefense/gem_checks/badges/gpa.svg)](https://codeclimate.com/github/mobiledefense/gem_checks)
[![Test Coverage](https://codeclimate.com/github/mobiledefense/gem_checks/badges/coverage.svg)](https://codeclimate.com/github/mobiledefense/gem_checks/coverage)
[![Build Status](https://travis-ci.org/mobiledefense/gem_checks.svg?branch=master)](https://travis-ci.org/mobiledefense/gem_checks)

Is a small tool to help ensure that your project does not contain any vulnerable dependencies.
We do this by scraping information from [gemnasium](https://gemnasium.com),
please keep in mind that the use of Gemnasium's information is governed by their [terms and conditions](https://gemnasium.com/terms).

## Installing gem_checks
Via Rubygems:
```
gem install gem_checks
```

## Usage
You can simply run
```
gem_checks /path/to/gemfile.lock
```

## Contributing
Pull requests are always welcome. See our [contributing guide] for
more details.

## License
Gem Checks is free software, and may be redistributed under the terms specified in the [license].

[contributing guide]: https://github.com/mobiledefense/gem_checks/blob/master/CONTRIBUTING.md
[license]: https://github.com/mobiledefense/gem_checks/blob/master/LICENSE.txt
