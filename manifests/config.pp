class sphinx::config($activate_service)
{
  if $activate_service {
    exec { 'activate_sphinx':
      command => 'sed -i "s/START=no/START=yes/g" /etc/default/sphinxsearch',
      unless  => 'grep -q "START=yes" /etc/default/sphinxsearch',
      path    => '/usr/local/bin::/usr/bin:/bin',
    }
  }
}