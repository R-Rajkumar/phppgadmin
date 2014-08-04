class phppgadmin::params{

  $db_host  = 'localhost'
  $db_port  = '5432'
  $extra_login_security = false

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora': {
      $phppgadmin_package = 'phpPgAdmin'
      $phppgadmin_conf_file = '/etc/phpPgAdmin/config.inc.php'
      $phppgadmin_conf_template_file = 'phppgadmin/CentOS/config.inc.php.erb'
      $http_conf_file     = '/etc/httpd/conf.d/phpPgAdmin.conf'
      $http_conf_template_file = 'phppgadmin/CentOS/phpPgAdmin.conf.erb'
    }
    'Debian', 'Ubuntu': {
      $phppgadmin_package = 'phppgadmin'
      $phppgadmin_conf_file = '/etc/phppgadmin/config.inc.php'
      $phppgadmin_conf_template_file = 'phppgadmin/Ubuntu/config.inc.php.erb'
      $http_conf_file     = '/etc/phppgadmin/apache.conf'
      $http_conf_template_file = 'phppgadmin/Ubuntu/phppgadmin.conf.erb'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}|${::operatingsystem}")
    }
  }
}