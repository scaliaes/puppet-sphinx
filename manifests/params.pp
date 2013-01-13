# Class: sphinx::params
#
#   Sphinx configuration settings.
#
class sphinx::params {

  case $::osfamily {
    'RedHat': {
      $sphinx_package_name     = 'sphinx'
      $sphinx_service_name     = 'searchd'
      $sphinx_activate_service = false
    }

    'Debian': {
      $sphinx_package_name     = 'sphinxsearch'
      $sphinx_service_name     = 'sphinxsearch'
      $sphinx_activate_service = true
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat or Debian")
    }
  }

}