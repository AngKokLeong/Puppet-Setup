
class moveFile {


  exec { 'create-home-folder':
    command => ["mkdir /home/3114394F"],
    provider => 'shell',
    onlyif => "test ! -d /home/3114394F"
  }

  file { 'move-file-to-agent':
    path => '/home/3114394F/moveFile3114394F.txt',
    ensure => 'file',
    source => 'puppet:///modules/moveFile/moveFile3114394F.txt',
    recurse => 'remote',
    require => Exec["create-home-folder"]
  }


}
