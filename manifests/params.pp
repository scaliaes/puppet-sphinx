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
      $sphinx_config_file_path = '/etc/sphinx/sphinx.conf'
    }

    'Debian': {
      $sphinx_package_name     = 'sphinxsearch'
      $sphinx_service_name     = 'sphinxsearch'
      $sphinx_activate_service = true
      $sphinx_config_file_path = '/etc/sphinxsearch/sphinx.conf'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat or Debian")
    }
  }

}
