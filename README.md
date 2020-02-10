# Gem Checks
[![Code Climate](https://codeclimate.com/github/mobiledefense/gem_checks/badges/gpa.svg)](https://codeclimate.com/github/mobiledefense/gem_checks)
[![Test Coverage](https://codeclimate.com/github/mobiledefense/gem_checks/badges/coverage.svg)](https://codeclimate.com/github/mobiledefense/gem_checks/coverage)
[![Build Status](https://travis-ci.org/mobiledefense/gem_checks.svg?branch=master)](https://travis-ci.org/mobiledefense/gem_checks)

Is a small tool to help ensure that your project does not contain any vulnerable dependencies.
We do this by scraping information from [gemnasium](https://gemnasium.com),
please keep in mind that the use of Gemnasium's information is governed by their [terms and conditions](https://gemnasium.com/terms).

## This project is now deprecated

In May 2018, [Gemnasium was acquired by GitLab]. Since Gemnasium is no longer availble
as a standalone service, this project no longer serves any practical purpose. This repo
will remain as a historical reference but it will no longer work.

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

[Gemnasium was acquired by GitLab]: https://docs.gitlab.com/ee/user/project/import/gemnasium.html
[contributing guide]: https://github.com/mobiledefense/gem_checks/blob/master/CONTRIBUTING.md
[license]: https://github.com/mobiledefense/gem_checks/blob/master/LICENSE.txt
