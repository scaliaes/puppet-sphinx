class sphinx::service(
  $service_name,
  $service_enable,
  $service_running
) {

  validate_re($service_name, '^.+$')
  validate_bool($service_enable, $service_running)

  service { $service_name:
    ensure     => $service_running ? { true => 'running', default => 'stopped', },
    enable     => $service_enable,
    hasrestart => true,
    hasstatus  => true,
  }
}
