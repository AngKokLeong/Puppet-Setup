
class mysql_installer {

  package { 'mysql-ubuntu':
    name => 'mysql-server',
    ensure => 'latest',
    provider => apt,
    before => Service['mysql-ubuntu-service']
  }

  service { 'mysql-ubuntu-service':
    name => 'mysql',
    ensure => 'running',
    enable => true,
    require => Package['mysql-ubuntu']
  }

  exec { 'execute-sql-command':
    # execute the shell script
    command => ['/bin/bash', 'mysql --user=user3114394F --password=password3114394F db3114394F'],
    provider => shell,
    require => Service['mysql-ubuntu-service']
  }

}
