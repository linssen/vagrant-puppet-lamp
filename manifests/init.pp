node default {
    exec { "apt-update":
      command => "/usr/bin/apt-get update",
    }

    Exec["apt-update"] -> Package <| |>

    class { "apt": }

    apt::ppa { "ppa:ondrej/php5-oldstable":}

    class { "::mysql::server":
        root_password => "root",
    }

    class { "php":
        service => "apache2",
        require => Apt::Ppa["ppa:ondrej/php5-oldstable"],
    }
    php::module { "mysql": }
    php::module { "intl": }
    php::module { "mcrypt": }

    class { "apache":
        default_vhost => false,
        mpm_module => "prefork",
    }
    class {"::apache::mod::php":
        path => "${::apache::params::lib_path}/libphp5.so",
    }
    apache::mod { "rewrite": }
    apache::vhost { $sitename:
        servername => $sitename,
        port => "80",
        docroot  => "/var/www/${sitename}/public_html",
        serveraliases => ["*.${sitename}",],
        directories => [
            { path => "/var/www/${sitename}/public_html",
                allow_override => ["all",],
            },
        ],
    }
}