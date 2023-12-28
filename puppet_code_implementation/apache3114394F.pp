
class apache3114394F {

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

  file { 'deploy html file':
    path => '/var/www/html/app3114394F/index.html',
    ensure => 'file',
    content => epp('module3114394F/index.epp'),
    require => Service["Apache Server Service"]
  }
}
