
class apache3114394F {

  $html_content = epp('module3114394f/index.epp')

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
    content => "${html_content}",
    require => Service["Apache Server Service"]
  }
}
