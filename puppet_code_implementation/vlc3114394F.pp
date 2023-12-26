# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt"
    }

    service { 'vlc_service':
      ensure => "running",
      enable => 'true',
      require => Package['VLC Media Player']
    }
}



