class profiles::sudoers {

  file_line { "allow /etc/sudoers notty":
    path   => '/etc/sudoers',
    line   => '#Defaults requiretty',
    match  => 'Defaults\s+requiretty',
  }

}