
hiera_include('classes')

$pkgs_to_update = hiera_array('update_packages')

package {
  $pkgs_to_update: ensure => latest;
}

$groups = hiera_hash('groups') | $key | { "Key '${key}' not found" }
create_resources('group', $groups)

$users = hiera_hash('users') | $key | { "Key '${key}' not found" }
create_resources('user', $users)

$files = hiera_hash('files') | $key | { "Key '${key}' not found" }
create_resources('file', $files)

include profiles::sudoers
include profiles::vagrant
include profiles::vmtools

