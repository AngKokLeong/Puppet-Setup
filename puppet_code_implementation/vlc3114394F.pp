# class definition

class vlc3114394F {
    
    package { 'VLC Media Player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt",
      before => File["transfer vlc service unit file to puppet agent"]
    }

    #https://stackoverflow.com/questions/31348013/puppet-transfer-files-to-agent
    file { 'transfer vlc service unit file to puppet agent':
      ensure => file,
      path => '/lib/systemd/system/vlc.service',
      require => Package['VLC Media Player'],
      content => "[Unit]\nDescription=vlc.service\n\n[Service]\nUser=root\nEnvironment='DISPLAY=:0'\nExecStart=/usr/bin/vlc\nWorkingDirectory=/\nRestart=always\n\n[Install]\nWantedBy=default.target"
    }

    exec { 'Change the command for vlc':
      command => ["sed -i 's/geteuid/getppid/' /usr/bin/vlc", "systemctl enable /lib/systemd/system/vlc.service"],
      provider => 'shell',
      require => File['transfer vlc service unit file to puppet agent']
    }

    service { 'vlc_service':
      name => 'vlc',
      ensure => "running",
      enable => 'true',
      require => Exec["Change the command for vlc"]
    }
}
