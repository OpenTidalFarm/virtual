#!/bin/bash

apt-get update

apt-get install scipy
apt-get install python-yaml
apt-get install python-pip
apt-get install git
pip install --user git+git://github.com/stephankramer/uptide.git
pip install --user utm

pip install --user https://github.com/OpenTidalFarm/OpenTidalFarm/archive/master.zip

cd /home/fenics
git clone git@github.com:OpenTidalFarm/OpenTidalFarm.git
cd OpenTidalFarm
git submodule init
git submodule update
cd ..
chown -R fenics OpenTidalFarm
