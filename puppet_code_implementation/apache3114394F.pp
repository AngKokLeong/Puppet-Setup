
class apache3114394F {

  $html_content = epp('module3114394F/index.epp')

  package { 'Apache Server':
    name => 'apache2',
    ensure => 'installed'
  }

  service { 'Apache Server Service':
    name => 'apache2',
    ensure => running,
    enable => true,
    require => Package["Apache Server"]
  }

  exec { 'Create app3114394F folder in /var/ww/html':
    command => ["mkdir /var/www/html/app3114394F/"],
    provider => shell,
    require => Service["Apache Service Service"]
  }


  file { 'deploy html file':
    path => '/var/www/html/app3114394F/index.html',
    ensure => 'file',
    content => "${html_content}",
    require => Exec["Create app3114394F folder in /var/ww/html"]
  }
}
