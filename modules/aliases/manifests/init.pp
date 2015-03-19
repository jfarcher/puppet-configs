class aliases::unixsupport {
mailalias { root:
    ensure => present,
    name => "root",
    recipient => "address@example.com",
    target => "/etc/aliases",
}
exec {"newaliases" :
    command => "/usr/bin/newaliases",
    refreshonly => true,
    subscribe => Mailalias["root"],
}

}
