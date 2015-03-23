class packages {
case $operatingsystemrelease {
    /^6.*/: {
        $verno = "6"
    }
    /^7.*/: {
        $verno = "7"
    }
}
        $base_packages = [
        "etckeeper",
        "htop",
        "iotop",
        "iftop",
        "unzip",
        "zsh",
        "tree",
        "lsof",
         ]

        $package_updates = [
        "openssl",
        "bash",
        "puppet",
        "tzdata",
        "rpm",
        "wget",
        "rsync",
        "facter",
        ]
case $::operatingsystem{
        RedHat,Centos:{
        $package_disc_updates = [
        "gnutls",
        "openssh-clients",
        "openssh",
        "glibc",
        ]
        $package_disc_base = [

        "mailx",
        "vim-enhanced",
        ]
        }
        Debian,Ubuntu:{
        $package_disc_updates = [
        "gnutls-bin",
        "openssh-client",
        "openssh-server",
        "libc6",
        ]
        $package_disc_base = [
        "mailutils",
        "vim",
        ]

        }
        }
        $all_packages = [
        $base_packages,
        $package_disc_base,
        ]

        $all_updates = [
        $package_disc_updates,
        $package_updates,
        ]

        package { $all_updates:
             ensure => latest,
        }
       package { $all_packages:
             ensure => installed,
        }
# VMware guest detection
case $productname {
    'VMware Virtual Platform': {
      # install vmware tools
      package { "open-vm-tools":
        name => "open-vm-tools",
        ensure => latest,
      }
    }
  }


}

