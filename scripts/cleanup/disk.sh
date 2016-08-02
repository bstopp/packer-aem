#!/usr/bin/env bash

# Empty logs
cat /dev/null > /var/log/wtmp

# Zero Disk
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
