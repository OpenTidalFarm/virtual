#!/bin/bash

apt-get update
# Docker image phusion/baseimage does not have add-apt-repository
apt-get -y install python-software-properties

# Add FEniCS PPA and install packages
add-apt-repository ppa:fenics-packages/fenics
apt-get update
apt-get -y install fenics

# Fix locale
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
