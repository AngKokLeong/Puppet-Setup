# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt"
    }

    service { 'vlc_service':
      ensure => "running",
      enabled => 'true',
      require => Package['VLC Media Player']
    }
}



