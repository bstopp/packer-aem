#!/usr/bin/env bash

# Clean up the yum data from kickstart
apt-get clean
apt-get autoremove

rm -f /tmp/${PUPPET_PKG}