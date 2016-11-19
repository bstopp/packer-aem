class profiles::vmtools {
  $root_home = hiera('profiles::vmtools::root-home')
  $tools_iso = hiera('profiles::vmtools::tools-iso')
  $install_cmd = hiera('profiles::vmtools::install-cmd')

  $req_packages = hiera_array('profiles::vmtools::required-packages', undef)

  anchor { 'profiles::vmtools::start': }

  file { '/tmp/vmtools':
    ensure => directory
  }

  mount { '/tmp/vmtools':
    ensure  => mounted,
    device  => "${root_home}/${tools_iso}",
    fstype  => 'iso9660',
    options => 'ro,loop'
  }

  exec { 'install vmtools':
    command => $install_cmd,
    path    => [ '/bin', '/usr/bin', ]
  }

  exec { 'remove /tmp/vmtools':
    command => 'umount /tmp/vmtools ; rmdir /tmp/vmtools',
    path    => [ '/bin', '/usr/bin', ],
    onlyif  => 'test -d /tmp/vmtools'
  }

  file { "${root_home}/${tools_iso}":
    ensure => absent
  }

  file_line { 'remove /etc/fstab /tmp/vmtools':
    path    => '/etc/fstab',
    line    => '#/tmp/vmtools removed',
    match   => '/tmp/vmtools'
  }
  anchor { 'profiles::vmtools::end': }


  Anchor['profiles::vmtools::start']
  -> File['/tmp/vmtools']
  -> Mount['/tmp/vmtools']
  -> Exec['install vmtools']
  -> Exec['remove /tmp/vmtools']
  -> File["${root_home}/${tools_iso}"]
  -> File_line['remove /etc/fstab /tmp/vmtools']
  -> Anchor['profiles::vmtools::end']
}