# puppet-ganesha

This module manages basic installation of NFS-Ganesha, its Systemd service unit and its configuration file.

The module is meant to be driven primarily from Hiera.

## Installation

Including the module will install software package and a basic configuration file:


```puppet
include ::ganesha
```

## Configuration via Hiera

```puppet
ganesha::package_ensure: present
ganesha::config_hash:
    EXPORT_DEFAULTS:
        AccessType: None
        Protocols: NFSv4
        Squash: root_squash
    EXPORT@backups:
        Export_Id: 1
        Path: /backups
        Pseudo: /backups
        FSAL:
            Name: CEPH
        CLIENT@servers:
            Clients:
                - 10.0.0.1/24
            AccessType: RW
```

Note that the right-hand part of any key with **@** will be discarded. In this
way, multiple configuration blocks of the same type can be defined. It also
helps in merging of config in Hiera.
