class sphinx (
  $package_name   = $::sphinx::params::sphinx_package_name,
  $package_ensure = 'present',
  $service_name   = $::sphinx::params::sphinx_service_name,
  $service_enabled = $::sphinx::params::sphinx_activate_service,
  $config_file    = undef,
) inherits sphinx::params {

  # because validate_string will not catch empty strings
  validate_re($package_name, '^.+$')
  validate_re($package_ensure, '^.+$')
  validate_re($service_name, '^.+$')
  validate_bool($service_enabled)
  if $config_file { validate_absolute_path($config_file) }

  anchor {'sphinx_first':} -> Class['sphinx::package']

  class { 'sphinx::package':
    package_name   => $package_name,
    package_ensure => $package_ensure,
    notify         => Class['sphinx::service'],
  }

  class { 'sphinx::config':
    activate_service   => $sphinx::params::sphinx_activate_service,
    config_file_source => $config_file,
    config_file_path   => $sphinx::params::sphinx_config_file_path,
    require            => Class['sphinx::package'],
    notify             => Class['sphinx::service'],
  }

  class { 'sphinx::service':
    service_name => $service_name,
    service_enabled => $service_enabled,
  }

  Class['sphinx::service'] -> anchor {'sphinx_last':}
}
