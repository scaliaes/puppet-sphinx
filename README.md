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

## Anchors

This module defines the following anchors so you can control when the class will be run

    Anchor['sphinx_first']
    Anchor['sphinx_last']

## Author

[Scalia](https://github.com/scalia)
