
class movefile {


  exec { 'create-home-folder':
    command => ["mkdir /home/3114394F"],
    provider => 'shell',
    onlyif => "test ! -d /home/3114394F"
  }

  file { 'move-file-to-agent':
    path => '/home/3114394F/moveFile3114394F.txt',
    ensure => 'file',
    source => 'puppet:///modules/movefile/moveFile3114394F.txt',
    owner => 'user3114394F',
    group => 'user3114394F',
    mode => '0644',
    recurse => 'remote',
    require => Exec["create-home-folder"]
  }


}
