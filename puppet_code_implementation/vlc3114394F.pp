# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      ensure => "latest",
      provider => "apt"
    }

    service { 'vlc_service':
      ensure => "running",
      require => Package['VLC Media Player']
    }
}



