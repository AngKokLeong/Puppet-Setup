
class module3114394f::ntp3114394f{

  package { 'ntpmodule' :
    name => 'chrony',
    ensure => 'installed'
  }

  file { 'configure-ntp':
    path => 'etc/chrony.conf',
    ensure => 'present',
    content => "$timeserver"
  }

  service { 'ntp-service':
    name => 'chronyd',
    ensure => 'running',
    enable => 'true'
  }
  

}
