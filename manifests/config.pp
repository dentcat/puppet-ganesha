class ganesha::config inherits ganesha {

  file { $::ganesha::config_file :
    ensure  => file,
    content => template('ganesha/ganesha.conf.erb'),
    owner   => $::ganesha::config_file_owner,
    group   => $::ganesha::config_file_group,
    mode    => $::ganesha::config_file_mode,
    notify  => Class['ganesha::service'],
    require => Class['ganesha::install'],
  }

}
