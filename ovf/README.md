# Open Visualization Format images for FEniCS

These scripts create an Open Visualization Format (OVF) image for
running FEniCS and dolfin-adjhoint inside a virtual machine. 
If you are just looking for a recent pre-built image go to <http://fenicsproject.org/pub/virtual/>.

## The FEniCS virtual machine image

The FEniCS virtual machine image is built on a recent Ubuntu release,
with the LXDE window manager. LXDE provides a good compromise between
ease of use and low system requirements.

The image is built using Packer (<https://packer.io/>). Packer
downloads the Ubuntu ISO, builds a virtual machine, provisions the
machine, installs the FEniCS Project and dolfin-adjoint,
and creates an OVF image, without any user intervention.


## Building a FEniCS virtual machine image

### Requirements

- Packer (<https://packer.io/>)
- VirtualBox (<https://www.virtualbox.org/>)

VirtualBox is available as a Debian/Ubuntu package (`sudo apt-get
install virtualbox`). Packer binaries are available from
<https://packer.io/>.


### User name and password

The user name and password for the virtual machine are both 'fenics'.


### Building the image

The image is built by the command

    packer -machine-readable build fenics.json | tee packer-output.txt

It may take around 20 minutes to build the image.

The created image will be found at

    output-fenics-X.Y.Z-ubuntu-YYYY-MM-DD/fenics-X.Y.Z-ubuntu-YYYY-MM-DD.ova

where `X.Y.Z` is the FEniCS version and `YYYY-MM-DD` is today's date, for example:

    output-fenics-1.5.0-2015-03-20/fenics-1.5.0-2015-03-20.ova


### Copying the image to the FEniCS server

This step requires write access the the FEniCS server.

The script `push-to-website.sh` will automatically copy the OVA image
to fenicsproject.org and create a symbolic link from
`pub/virtual/fenics-latest.ova` to the uploaded file.

Example of usage:

    ./push-to-website.sh packer-output.txt

where `packer-output.txt` is the output file created by packer
called with the `-machine-readable` option enabled.


## Technical details

The following details about how the image is built are intended for
advanced users and developers. Regular users can just download the
image as discussed above.

- Packer is used to create and provision the image.
- The images are built from an Ubuntu 14.04 Server ISO directly from Canonical.
- For maximum user friendliness we use the LXDE window manager.
- FEniCS is installed from the FEniCS PPA packages 
  (<https://launchpad.net/~fenics-packages>).
- dolfin-adjoint is installed from the libadjoint PPA package
  (<https://launchpad.net/~libadjoint/>).
- Various helpful utilities such as gedit, Paraview, vim, and emacs are
  already installed.


### FEniCS versions

FEniCS is installed from the FEniCS PPA
(<https://launchpad.net/~fenics-packages>).

dolfin-adjoint is installed from the libadjoint PPA
(<https://launchpad.net/~libadjoint/>).


### Provisioning

The image is provisioned by the Bash scripts in `scripts/'. They are
called in the order:

1. `update-apt.sh`       (run `apt-get update`)
1. `fenics.sh`           (add the FEniCS PPA and install `fenics` package)
1. `gui.sh`              (add GUI packages)
1. `utils.sh`            (add miscellaneous useful packages)
1. `cleanup.sh`          (clean `apt` cache and temp files)
1. `dolfin-examples.sh`  (copy DOLFIN examples into user directory)
