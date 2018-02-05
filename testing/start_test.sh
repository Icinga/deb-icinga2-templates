#!/bin/bash

set -ex

#This should work for any .deb Package

cd archive

apt-ftparchive packages . > Packages

sudo su -c 'echo "deb [trusted=yes] file:$(pwd)/ ./" >>  /etc/apt/sources.list'

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install --allow-unauthenticated -y icinga2-templates

ls -al /usr/share/icinga2/include
cat /usr/share/icinga2/include/itl
ls -al /usr/share/doc/icinga2-templates
