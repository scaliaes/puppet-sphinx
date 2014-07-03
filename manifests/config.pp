class sphinx::config(
  $activate_service, 
  $config_file_source, 
  $config_file_path
) {

  validate_bool($activate_service)
  validate_absolute_path($config_file_path)
  if $config_file_source { validate_re($config_file_source, '^puppet:.$') }
  
  if $activate_service {
    exec { 'activate_sphinx':
      command => 'sed -i "s/START=no/START=yes/g" /etc/default/sphinxsearch',
      unless  => 'grep -q "START=yes" /etc/default/sphinxsearch',
      path    => '/usr/local/bin::/usr/bin:/bin',
    }
  }

  if $config_file_source {
    file { $config_file_path:
      ensure => present,
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => $config_file_source,
    }
  }

}
