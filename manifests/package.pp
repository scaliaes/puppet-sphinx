class sphinx::package($package_name, $package_ensure)
{
  package { 'sphinx':
    name   => $package_name,
    ensure => $package_ensure,
  }
}