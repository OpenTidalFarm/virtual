# Builds a Docker image with FEniCS built from git sources.
# Authors: 
# Lizao Li <lixx1445@umn.edu>
# Jack S. Hale <jack.hale@uni.lu>

FROM fenicsproject/dev:latest
MAINTAINER fenics-project <fenics@fenicsproject.org>

WORKDIR /opt
ADD https://bitbucket.org/fenics-project/fenics-virtual/downloads/fenics.conf /opt/fenics.conf

RUN /bin/bash -c "source fenics.conf && \
                  update_fenics"

ENV HOME /home/fenics

CMD ["/sbin/my_init"]
