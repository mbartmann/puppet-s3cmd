# S3cmd

[![Build Status](https://travis-ci.org/netflower/puppet-s3cmd.svg)](https://travis-ci.org/netflower/puppet-s3cmd)

Puppet module to install a newer version of [S3cmd](https://github.com/s3tools/s3cmd), the command line tool for managing Amazon S3 and CloudFront services.
Most distributions package only older versions and
this module downloads a specific release from GitHub.

## Usage

Include the `s3cmd` class in your manifest to install it.

```puppet
include s3cmd
```

If you not set any parameters, s3cmd will be installed with its default configuration.

Here is an example declaring the class with the full list of available parameters and their defaults:

```puppet
class { 's3cmd':
  $install_bin = '/usr/local/bin',
  $install_dir = '/usr/local/share',
  $temp_dir    = '/tmp',
  $version     = 'v1.5.2',
}
```
