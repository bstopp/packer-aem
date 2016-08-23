
group { 'vagrant':
  ensure => present,
}

user { 'vagrant':
  ensure     => present,
  home       => "/home/vagrant",
  managehome => true,
  gid        => 'vagrant',
  groups     => ['vagrant',],
  shell      => '/bin/bash'
}

file { "/home/vagrant/.ssh":
  ensure  => directory,
  owner   => 'vagrant',
  group   => 'vagrant',
  mode    => '0600',
  require => User['vagrant'],
}

ssh_authorized_key { 'vagrant':
  ensure => present,
  key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
  type   => 'ssh-rsa',
  user   => 'vagrant'
}

class { 'sudo': }

sudo::conf { 'vagrant':
  content => '%vagrant ALL=(ALL) NOPASSWD: ALL'
}

file_line { "allow /etc/sudoers notty":
  path   => '/etc/sudoers',
  line   => '#Defaults requiretty',
  match  => 'Defaults\s+requiretty',
}

Group['vagrant']
-> User['vagrant']
-> File['/home/vagrant/.ssh']
-> Ssh_Authorized_Key['vagrant']
