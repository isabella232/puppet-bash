# === Authors
#
# Zan Loy <zan.loy@stopso.com>
#
# === Copyright
#
# Copyright 2013
#
class bash(
  $bashrc = $bash::params::bashrc,
) inherits bash::params {

    package { 'bash':
        ensure => present,
    }

    File {
        ensure => file,
        owner => 'root',
        group => 'root',
        mode => 0444,
        require => Package['bash'],
    }
    file {
        '/etc/bashrc.d':
            ensure => directory,
            source => "puppet:///modules/${module_name}/etc/bashrc.d",
            recurse => true,
            force => true,
            purge => true;
        $bashrc:
            content => template("${module_name}/bashrc.erb");
    }

}