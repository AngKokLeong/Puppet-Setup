
class mysql_installer {

  $mysql_command = "mysql -e "
  $create_new_database = epp('mysql/create_new_database.epp', {database_name => db3114394F})

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
    command => ["${mysql_command}${create_new_database}"],
    provider => shell,
    require => Service['mysql-ubuntu-service']
  }

}
