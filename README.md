# Sphinx module for Puppet

This module manages sphinx on Linux (RedHat/Debian) distros.

## Installation

Clone this repo to your Puppet modules directory

    git clone git://github.com/scalia/puppet-sphinx.git sphinx

## Usage

Add the following to your site manifest:

    class { 'sphinx':
      config_file => 'puppet:///modules/scaliadev/sphinx/project.sphinx.conf',
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

[Scalia](https://github.com/scalia)
