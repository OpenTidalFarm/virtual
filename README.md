# FEniCS with virtual machines and containers

*NOTE: This repository is currently under rapid development, so things may not work as described!*

This repository contains tools for running FEniCS
(<http://fenicsproject.org>) in virtual machines and Linux containers.

If you want to run FEniCS in a virtual machine, a lightweight image is
available at (<http://fenicsproject/pub/virtual/fenics-latest.ova>). 
It can be run using VirtualBox (<http://www.virtualbox.org/>).

## Contents

This repository contains scripts for:

1. For building Open Virtualization Format (OVF) images that can be
    run using virtual machine tools, e.g. VirtualBox
    (<https://www.virtualbox.org/>). The scripts are located in the
    directory `ovf/`.

2. Running FEniCS inside a Linux container using Docker
   (<https://www.docker.com/>). The scripts are located in the
   directory `docker/`. (*under development*).

## Support

Please report any issues with Vagrant, Docker or these instructions at
<fenics-support@fenicsproject.org>. Specific issues can be registered
on the issue tracker at
<https://bitbucket.org/fenics-project/fenics-virtual/issues>.

## Authors

The scripts and instructions have been produced by
Jack S. Hale (<jack.hale@uni.lu>),
Lizao Li (<lixx1445@umn.edu>)
and
Garth N. Wells (<gnw20@cam.ac.uk>).