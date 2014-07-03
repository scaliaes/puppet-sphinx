class sphinx::package(
  $package_name, 
  $package_ensure
) {

  validate_re($package_name, '^.+$')
  validate_re($package_ensure, '^.+$')
  
  package { 'sphinx':
    name   => $package_name,
    ensure => $package_ensure,
  }
}
