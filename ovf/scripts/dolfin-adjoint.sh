#!/bin/bash

apt-get update
# Docker image phusion/baseimage does not have add-apt-repository
apt-get -y install software-properties-common

# Add dolfin-adjoint PPA and install packages
add-apt-repository ppa:libadjoint/ppa
apt-get update
apt-get -y install python-dolfin-adjoint
