class sphinx (
  $package_name   = $sphinx::params::sphinx_package_name,
  $package_ensure = 'present',
  $service_name   = $sphinx::params::sphinx_service_name,
) inherits sphinx::params {

  class { 'sphinx::package':
    package_name   => $package_name,
    package_ensure => $package_ensure,
    notify         => Class['sphinx::service'],
  }

  class { 'sphinx::config':
    activate_service => $sphinx::params::sphinx_activate_service,
    require => Class['sphinx::package'],
    notify  => Class['sphinx::service'],
  }

  class { 'sphinx::service':
    service_name     => $service_name,
  }

}