# Open Visualization Format images for FEniCS

These scripts create an Open Visualization Format (OVF) image for
running FEniCS inside a virtual machine. The image is targeted at
users who are trying FEniCS for the first time, and for FEniCS-based
educational courses.

*We maintain an up-to-date OVF image that can be always be downloaded from
<http://fenicsproject.org/pub/virtual/fenics-latest.ova>*

## Using the FEniCS virtual machine image

### Requirements

- A 64-bit host operating system (since the image is built on a 64-bit
  system).
- A virtual machine system that supports the Open Visualization
  Format (OVF), e.g. VirtualBox (<https://www.virtualbox.org/>).

### Getting the image

The latest OVF image can be downloaded from
<http://fenicsproject.org/pub/virtual/fenics-latest.ova>. The
image can be used with various virtual machine managers. VirtualBox is
recommended.

You can look at old images by browsing the page at <http://fenicsproject.org/pub/virtual>.

### Using the image with VirtualBox

We recommend the freely available VirtualBox virtualization product
(<https://www.virtualbox.org/>).  With VirtualBox, the image can be
imported via `File -> Import Appliance`.

The username is `vagrant` and the password is `vagrant`.

The virtual machine is behind a NAT firewall and cannot be accessed by
other users on your public network.

The image has the text editors `emacs`, `gedit` and `vi` installed,
and the web browser `firefox`.

## Technical details

The following details about how the image is built are intended for
advanced users and developers. Regular users can just download the image
as discussed above.

- Packer is used to create and provision the image.
- The images are built from an Ubuntu 14.04 Server ISO directly from Canonical.
- To minimize the size of the image, we use the lightweight Fluxbox window manager.
- FEniCS is installed from the FEniCS PPA packages
  (<https://launchpad.net/~fenics-packages>).

## Building the image

### Requirements

The following packages are required:

- Packer  (<http://www.packer.io/>)
- VirtualBox (<https://www.virtualbox.org/>)

For Debian/Ubuntu:

    sudo apt-get install virtualbox
    
Packer must be installed from the Packer website (<http://www.packer.io/>).

### Provision the FEniCS virtual machine image

To provision the minimal image with FEniCS components, run:

    packer build fenics.json

This will automatically generate the image and run the provisioning scripts.

Packer will then export the image to the OVA format.

The output naming convention is:

    output-fenics-X.Y.Z-ubuntu-YYYY-MM-DD/fenics-X.Y.Z-ubuntu-YYYY-MM-DD.ova

where `X.Y.Z` is the FEniCS version and `YYYY-MM-DD` is today's date, for example:

    output-fenics-1.5.0-2015-03-20/fenics-1.5.0-2015-03-20.ova
