# class definition

class vlc3114394f {
    
    package { 'vlc-media-player':
      name => 'vlc',
      ensure => "latest",
      provider => "apt",
      before => File["transfer-vlc-service-unit-file-to-puppet-agent"]
    }

    #https://stackoverflow.com/questions/31348013/puppet-transfer-files-to-agent
    #https://stackoverflow.com/questions/73082615/setting-up-a-systemd-service-to-loop-videos-using-vlc-on-a-raspberry-pi 
    file { 'transfer-vlc-service-unit-file-to-puppet-agent':
      ensure => file,
      path => '/lib/systemd/system/vlc.service',
      require => Package['VLC Media Player'],
      content => "[Unit]\nDescription=vlc.service\n\n[Service]\nUser=root\nEnvironment='DISPLAY=:0'\nExecStart=/usr/bin/vlc\nWorkingDirectory=/\n\n[Install]\nWantedBy=default.target"
    }

    exec { 'change-the-permission-for-vlc-binary':
      command => ["sed -i 's/geteuid/getppid/' /usr/bin/vlc"],
      provider => 'shell',
      onlyif => "test -e /usr/bin/vlc",
      require => File['transfer-vlc-service-unit-file-to-puppet-agent']
    }

    exec { 'enable-vlc-service-in-systemd':
      command => ["systemctl enable /lib/systemd/system/vlc.service"],
      provider => 'shell',
      onlyif => "test -e /lib/systemd/system/vlc.service",
      require => Exec["change-the-permission-for-vlc-binary"]
    }

    service { 'vlc_service':
      name => 'vlc',
      ensure => "running",
      enable => 'true',
      require => Exec["enable-vlc-service-in-systemd"]
    }
}
