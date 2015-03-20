#!/bin/bash

# Copy demo files into user directory and change owner
cp -r /usr/share/dolfin/demo/ $HOME/dolfin-demo
chown -R $USER $HOME/dolfin-demo
chgrp -R $USER $HOME/dolfin-demo
