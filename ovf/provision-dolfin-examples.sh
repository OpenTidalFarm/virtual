#!/bin/bash

# Copy demo files into user directory and change owner
cp -r /usr/share/dolfin/demo/ $HOME/dolfin-demo
chown -R $USER $HOME/dolfin-demo
chgrp -R $USER $HOME/dolfin-demo

# Display a message
echo ""
echo "FEniCS VM has been configured and loaded."
echo "You can now login to the VM by typing"
echo ""
echo "    vagrant ssh"
echo ""
echo "Example programs can be found in the directory"
echo ""
echo "    ${HOME}/dolfin-demo"
