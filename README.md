# Gem Checks
Is a small tool to help ensure that your project does not contain any vulnerable dependencies.
We do this by scraping information from [gemnasium](https://gemnasium.com),
please keep in mind that the use of Gemnasium's information is governed by their [terms and conditions](https://gemnasium.com/terms).

## Installing gem_checks
Via Rubygems:
```
bundle install gem_checks
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
