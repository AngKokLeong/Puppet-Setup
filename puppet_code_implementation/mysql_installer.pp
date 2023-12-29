
class mysql_installer {

  $mysql_command = "mysql -e "
  $create_new_database = epp('mysql/create_new_database.epp', { 'database_name' => 'db3114394F' })
  $create_new_database_user = epp('mysql/create_new_database_user.epp', { 'user_name' => 'user3114394F' , 'password' => 'password3114394F' })

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

  exec { 'execute-sql-command-to-create-database':
    # execute the shell script
    command => [
      "${mysql_command}${create_new_database}"
    ],
    provider => shell,
    require => Service['mysql-ubuntu-service']
  }

  exec { 'execute-sql-command-to-create-user':
    # execute the shell script
    command => [
        "${mysql_command}${create_new_database_user}"
    ],
    provider => shell,
    require => Exec['execute-sql-command-to-create-database']
  }
}
