class phppgadmin(
  $db_host  = $phppgadmin::params::db_host,
  $db_port  = $phppgadmin::params::db_port,
  $extra_login_security = $phppgadmin::params::extra_login_security,
  $deny = 'deny from all'
) inherits phppgadmin::params {

  package{$phppgadmin::params::phppgadmin_package:
    ensure => installed,
  }

  file{$phppgadmin::params::http_conf_file:
    ensure  => present,
    mode    => '0644',
    content => template($phppgadmin::params::http_conf_template_file),
    require => Package[$phppgadmin::params::phppgadmin_package],
  }

  file{$phppgadmin::params::phppgadmin_conf_file:
    ensure  => present,
    mode    => '0644',
    content => template($phppgadmin::params::phppgadmin_conf_template_file),
    require => Package[$phppgadmin::params::phppgadmin_package],
  }

  service { apache2:
    ensure => running,
    enable => true,
    subscribe =>[ File[$phppgadmin::params::http_conf_file],
                  File[$phppgadmin::params::phppgadmin_conf_file],
                ],
  }

}

