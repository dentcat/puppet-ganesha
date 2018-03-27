class ganesha::service {

  if $::ganesha::service_manage {
    service { $::ganesha::service_name :
      ensure  => $::ganesha::service_ensure,
      enable  => $::ganesha::service_enable,
      restart => $::ganesha::service_restart,
      require => Class['ganesha::config'],
    }
  }
}
