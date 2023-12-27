# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt",
      before => Exec["Change the command for vlc"]
    }

    exec { 'Change the command for vlc':
      command => ["/bin/bash", "sed -i 's/geteuid/getppid/' /usr/bin/vlc"],
      provider => 'shell',
      require => Package['VLC Media Player']
    }

    service { 'vlc_service':
      ensure => "running",
      enable => 'true',
      require => Exec["Change the command for vlc"]
    }
}
