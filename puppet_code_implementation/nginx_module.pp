
class nginx_module {

  package { 'nginx':
    name => 'nginx',
    ensure => 'install',
    before => File['/etc/nginx/nginx.conf']
  }

  file { '/etc/nginx/nginx.conf':
    ensure => present,
    content => 'This is the nginx configuration file.',
    notify => Service['nginx']
  }

  service { 'nginx':
    ensure => running,
    require => File['/etc/nginx/nginx.conf']
  }
}
