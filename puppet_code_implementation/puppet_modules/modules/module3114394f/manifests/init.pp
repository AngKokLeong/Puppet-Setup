
class module3114394f {

  contain module3114394f::apache3114394f
  contain module3114394f::ntp3114394f

  Class['module3114394f::apache3114394f']
  -> Class['module3114394f::ntp3114394f']

}
