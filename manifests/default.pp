class { 'mongodb':
    enable_10gen => true,
}

class python {
    package {
        "build-essential": ensure => latest;
        "python": ensure => latest;
        "ipython": ensure => latest;
        "python-setuptools": ensure => latest;
        "bottle": ensure => latest, provider => pip;
        "pymongo": ensure => latest, provider => pip;
    }
    exec { "easy_install pip":
        alias => "pip",
        path => "/usr/local/bin:/usr/bin:/bin",
        require => Package["python-setuptools"],
        unless => "which pip",
    }
}

include python
