
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
    command => @("MYSQL Commands"/L)
      mysql \ 
      -e "CREATE USER 'user3114394F'@'localhost' IDENTIFIED BY 'password3114394F';", \
      -e "CREATE DATABASE db3114394F;", \
      -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, INDEX, DROP, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON db3114394F.* TO 'user3114394F'@'localhost';"
      |-"MYSQL Commands"
    ,
    provider => shell,
    require => Service['mysql-ubuntu-service']
  }

}
