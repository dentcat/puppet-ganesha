class ganesha (
  String $package_name,
  String $package_ensure,
  String $config_file,
  String $config_file_owner,
  String $config_file_group,
  String $config_file_mode,
  Hash $config_hash,
  String $service_name,
  Boolean $service_manage,
  String $service_ensure,
  Variant[Boolean, String] $service_enable,
  String $service_restart,
) {

  contain ::ganesha::install
  contain ::ganesha::config
  contain ::ganesha::service

  Class['ganesha::install']
  -> Class['ganesha::config']
  ~> Class['ganesha::service']
}
