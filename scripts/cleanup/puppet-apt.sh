#!/usr/bin/env bash


apt-get -y --purge remove puppet-agent

rm -Rf /opt/puppetlabs
rm -Rf /var/run/puppetlabs
rm -Rf /etc/puppetlabs
