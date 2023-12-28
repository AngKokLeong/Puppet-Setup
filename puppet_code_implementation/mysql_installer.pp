
class mysql_installer {

  $mysql_command = "mysql -e "


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
    command => ["${mysql_command}${epp('mysql/create_new_database.epp', {database_name => db3114394F})}"],
    provider => shell,
    require => Service['mysql-ubuntu-service']
  }

}
