class screen {

         package { "screen":

                        ensure => latest,
        }
         file { "/etc/screenrc":
                ensure => file,
                source => 'puppet:///modules/screen/screenrc',
                path => "/etc/screenrc",
                owner   => root,
                group   => root,
                mode    => 644,
                require => Package["screen"],
        }

}

