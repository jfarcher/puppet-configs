class ntp::client {

case $::operatingsystem{
                        RedHat,CentOS:{ $servicename = "ntpd" }
                        Debian,Ubuntu:{ $servicename = "ntp"  }
}
         package { "ntp":

                        ensure => installed,
        }
         file { "/etc/ntp.conf":
                ensure => file,
                source => 'puppet:///modules/ntp/ntp.conf',
                path => "/etc/ntp.conf",
                owner   => root,
                group   => root,
                mode    => 644,
                require => Package["ntp"],
                notify  => Service[$servicename],
        }
         service { $servicename:

                 name       => $servicename,
                 ensure     => running,
                 hasrestart => true,
                 require    => Package["ntp"],
         }

}

