
class puppet_agent_setup {



  group {'myuser':
    ensure => 'present'
  }

  group { 'admins':
    ensure => 'present'
  }

  user { 'myuser':
    ensure => 'present',
    shell => '/bin/bash'
    managehome => true,
    gid => 'myuser',
    group => ['admins']
  }

  package {'sudo':
    ensure => 'present'
  }


}
