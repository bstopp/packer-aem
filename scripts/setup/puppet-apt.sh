#!/usr/bin/env bash

if ! [ -n "${PUPPET_PKG}" ]; then
  echo "No puppet package found, can't setup puppet."
  exit 1
fi

if ! [ -n "${PUPPET_MODULE_PATH}" ]; then
  echo "No puppet module path specified, can't setup puppet."
  exit 1
fi

# Install the puppet repo RPM
cd /tmp
wget https://apt.puppetlabs.com/${PUPPET_PKG}
sudo dpkg -i ${PUPPET_PKG}
apt-get update

# Install puppet for next provisioner
apt-get -y install puppet-agent
printf 'Puppet ' ; /opt/puppetlabs/bin/puppet --version

for mod in "$@"
do
  /opt/puppetlabs/bin/puppet module install $mod --modulepath=${PUPPET_MODULE_PATH} >/dev/null 2>&1
done

printf 'Modules installed: ' ; /opt/puppetlabs/bin/puppet module list --modulepath=${PUPPET_MODULE_PATH}
