# Open Visualization Format images for FEniCS

These scripts create an Open Visualization Format (OVF) image for
running FEniCS inside a virtual machine. The image is targeted at
users who are trying FEniCS for the first time, and for the use of
FEniCS is courses.


## Using the FEniCS virtual machine image

### Requirements

- A 64-bit host operating system (since the image is built on a 64-bit
 system)
- A virtual machine system that supports Open the Visualization
  Format, e.g. VirtualBox (<https://www.virtualbox.org/>).

### Getting the image

The OVF image can be downloaded from
<http://fenicsproject.org/pub/vm/...>. The image can be used with
numerous virtual environments.


### Using the image with VirtualBox

We recommend the freely available VirtualBox
(<https://www.virtualbox.org/>).  With VirtualBox, the image can be
imported via `File -> Import Appliance`.

The image has the text editors `emacs`, `gedit` and `vi` installed,
and the web browser `firefox`.

The below details document how the image is built are intended for
advanced users and developers.


## Technical details

- Vagrant is used to create and provision the image.
- The images are built on a minimal Ubuntu 14.04 image.
- To minimize the size of the image, we use the lightweight Fluxbox
  window manager.
- FEniCS is installed from the FEniCS PPA packages
  (<https://launchpad.net/~fenics-packages<).


## Building the image

### Requirements

The following packages are required:

- Vagrant  (<http://www.vagrantup.com/>)
- VirtualBox (<https://www.virtualbox.org/>)

For Debian/Ubuntu:

    sudo apt-get install virtualbox vagrant

### Provision the image

To provision the minimal image with FEniCS components, run:

    vagrant up

This will download the image and run the provisioning scripts, and
launch a VirtualBox instance.

### Exporting the image

First shutdown the virtual instance. Then export the image via `File
-> Export Appliance`. The naming convention is:

    fenics-X.Y-ubuntu-XX.YY.ovf

where `X.Y` is the FEniCS version and `XX.YY` is the Ubuntu version on
which the image is based, for example

    fenics-1.5-ubuntu-14.04.ovf
