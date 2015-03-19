# Builds a Docker image with libraries for compiling FEniCS.
# The image is at:
#     https://registry.hub.docker.com/u/fenicsproject/development
# Authors: 
# Lizao Li <lixx1445@umn.edu>
# Jack S. Hale <jack.hale@uni.lu>

FROM phusion/baseimage:latest
MAINTAINER fenics-project <fenics@fenicsproject.org>

# Install build environment
RUN apt-get -qq update && \
    apt-get -y install \
    	 xauth cmake flex g++ gfortran git ipython openmpi-bin pkg-config \
         subversion wget bison sudo \
         libatlas-base-dev libboost-all-dev libcln-dev libcppunit-dev \
         libeigen3-dev libginac-dev liblapack-dev libmpfr-dev \
         libopenmpi-dev petsc-dev libptscotch-dev libsuitesparse-dev \
         libxml2-dev python-dev libhwloc-dev libvtk5-dev libpcre3-dev \
         libhdf5-openmpi-dev libeigen3-dev libcgal-dev libslepc3.4.2-dev \
         python-numpy python-scientific python-vtk python-six python-ply \
         python-netcdf python-pip xterm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install sympy, petsc4py, slepc4py, swig from source
RUN pip install sympy && \
    export PETSC_DIR=/usr/lib/petscdir/3.4.2 && \
    easy_install \
     https://bitbucket.org/petsc/petsc4py/downloads/petsc4py-3.4.tar.gz &&\
    export SLEPC_DIR=/usr/lib/slepcdir/3.4.2 && \
    easy_install \
     https://bitbucket.org/slepc/slepc4py/downloads/slepc4py-3.4.tar.gz &&\
    cd /tmp && \
    wget -nc http://downloads.sourceforge.net/swig/swig-3.0.3.tar.gz && \
    tar xf swig-3.0.3.tar.gz && \
    cd swig-3.0.3 && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/*

# Set up user so that we do not run as root
RUN useradd -m -s /bin/bash -G sudo fenics && \
    echo "fenics:docker" | chpasswd && \
    echo "fenics ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV HOME /home/fenics

CMD ["/sbin/my_init"]
