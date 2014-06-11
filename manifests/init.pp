class sphinx (
  $package_name            = $sphinx::params::sphinx_package_name,
  $package_ensure          = 'present',
  $service_name            = $sphinx::params::sphinx_service_name,
  $service_enable          = true,
  $sphinx_activate_service = $sphinx::params::sphinx_activate_service,
  $config_file             = undef,
) inherits sphinx::params {

  anchor {'sphinx_first':} -> Class['sphinx::package']

  class { 'sphinx::package':
    package_name   => $package_name,
    package_ensure => $package_ensure,
    notify         => $service_enable ? {
      true    => Class['sphinx::service'],
      default => undef,
    },
  }

  class { 'sphinx::config':
    activate_service   => $sphinx_activate_service,
    config_file_source => $config_file,
    config_file_path   => $sphinx::params::sphinx_config_file_path,
    require            => Class['sphinx::package'],
    notify             => $service_enable ? {
      true    => Class['sphinx::service'],
      default => undef,
    },
  }

  if $service_enable {
    class { 'sphinx::service':
      service_name => $service_name,
    }
    Class['sphinx::service'] -> anchor {'sphinx_last':}
  } else {
    Class['sphinx::config'] -> anchor {'sphinx_last':}
  }

}
