# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt",
      before => Exec["Change the command for vlc"]
    }

    #https://stackoverflow.com/questions/31348013/puppet-transfer-files-to-agent
    file { 'transfer vlc service unit file to puppet agent':
      ensure => file,
      source => "puppet:///modules/vlc3114394F/vlc.service",
      path => '/lib/systemd/system/vlc.service',
      require => Package['VLC Media Player']      
    }

    exec { 'Change the command for vlc':
      command => ["sed -i 's/geteuid/getppid/' /usr/bin/vlc", "systemctl enable /lib/systemd/system/vlc.service"],
      provider => 'shell',
      require => File['transfer vlc service unit file to puppet agent']
    }

    service { 'vlc_service':
      ensure => "running",
      enable => 'true',
      require => Exec["Change the command for vlc"]
    }
}
