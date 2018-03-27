class ganesha::install {

  ensure_packages([$::ganesha::package_name],
                  {ensure => $::ganesha::package_ensure})
}
