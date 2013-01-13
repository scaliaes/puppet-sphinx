# Class: sphinx::params
#
#   Sphinx configuration settings.
#
class sphinx::params {

  case $::osfamily {
    'RedHat': {
      $sphinx_service_name   = 'mysqld'
      $sphinx_package_name   = 'mysql'
      $sphinx_enable_service = false
    }

    'Debian': {
      $sphinx_service_name   = 'mysqld'
      $sphinx_package_name   = 'mysql'
      $sphinx_enable_service = true
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat or Debian")
    }
  }

}