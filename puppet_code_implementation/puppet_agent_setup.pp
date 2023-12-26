
class puppet_agent_setup {



  group {'myuser':
    ensure => 'present'
  }

  group { 'admins':
    ensure => 'present'
  }

  user { 'myuser':
    ensure => 'present',
    shell => '/bin/bash',
    managehome => true,
    gid => 'myuser',
    groups => ['admins']
  }

  package {'sudo':
    ensure => 'present'
  }

  file { '/etc/sudoers.d/myuser': 
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0400',
    content => 'myuser ALL=(ALL) NOPASSWD: ALL\n';
  }

}
