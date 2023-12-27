# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt",
      before => Exec["Change the command for vlc"]
    }

    file { 'transfer vlc service unit file to puppet agent':
      source => ["file: /home/dockeradm/Desktop/Puppet-Setup/puppet_code_implementation/systemd_unit_file/vlc.service"],
      path => '/lib/systemd/system/vlc.service',
      require => Package['VLC Media Player']      
    }

    exec { 'Change the command for vlc':
      command => ["sed -i 's/geteuid/getppid/' /usr/bin/vlc", "systemctl enable /lib/systemd/system/vlc.service"],
      provider => 'shell',
      require => File['VLC Media Player']
    }

    service { 'vlc_service':
      ensure => "running",
      enable => 'true',
      require => Exec["Change the command for vlc"]
    }
}
