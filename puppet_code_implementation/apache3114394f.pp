
class apache3114394f {

  $html_content = epp('module3114394f/index.epp')

  package { 'apache-server':
    name => 'apache2',
    ensure => 'installed'
  }

  service { 'apache-server-service':
    name => 'apache2',
    ensure => running,
    enable => true,
    require => Package["apache-server"]
  }

  exec { 'create-app3114394f-folder-in-var-www-html':
    command => ["mkdir /var/www/html/app3114394F/"],
    provider => shell,
    require => Service["apache-server-service"],
    onlyif => "test ! -d /var/www/html/app3114394F"
  }


  file { 'deploy-html-file':
    path => '/var/www/html/app3114394F/index.html',
    ensure => 'file',
    content => "${html_content}",
    require => Exec["create-app3114394f-folder-in-var-www-html"]
  }
}
