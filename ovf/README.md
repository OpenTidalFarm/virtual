# Open Visualization Format images for FEniCS

These scripts create an Open Visualization Format (OVF) image for
running FEniCS and dolfin-adjoint inside a virtual machine.

Pre-built images are at (<http://fenicsproject.org/pub/virtual/>).


## End users: Running a FEniCS virtual machine image

### Running

1. Install Virtualbox for your platform from
   (<http://virtualbox.org>).
2. Download the latest pre-built image from
   (<http://fenicsproject.org/pub/virtual/>).
3. Import the pre-built image by going to File > Import Appliance then
   selecting the OVA file you just downloaded. Click Import.  Wait for
   the import to finish.
4. Double click on the newly created image to start.

### User name and password

The user name and password for the virtual machine are both 'fenics'.


## Advanced users: Building your own FEniCS virtual machine image

### Requirements

- Packer (<https://packer.io/>)
- VirtualBox (<https://www.virtualbox.org/>)

VirtualBox is available as a Debian/Ubuntu package (`sudo apt-get
install virtualbox`). Packer binaries are available from
<https://packer.io/>.


## The FEniCS virtual machine image

The FEniCS virtual machine image is built on a recent Ubuntu release,
with the LXDE window manager. LXDE provides a good compromise between
ease of use and low system requirements.

The image is built using Packer (<https://packer.io/>). Packer
downloads the Ubuntu ISO, builds a virtual machine, provisions the
machine, installs the FEniCS Project and dolfin-adjoint, and creates
an OVF image, without any user intervention.


### Building

The image is built by the command

    packer -machine-readable build fenics.json | tee packer-output.txt

It may take around 20 minutes to build the image.

The created image will be found at

    output-fenics-X.Y.Z-ubuntu-YYYY-MM-DD/fenics-X.Y.Z-ubuntu-YYYY-MM-DD.ova

where `X.Y.Z` is the FEniCS version and `YYYY-MM-DD` is today's date,
for example:

    output-fenics-1.5.0-2015-03-20/fenics-1.5.0-2015-03-20.ova


### Copying the image to the FEniCS server

This step requires write access the the FEniCS server.

The script `push-to-website.sh` will automatically copy the OVA image
to fenicsproject.org and create a symbolic link from
`pub/virtual/fenics-latest.ova` to the uploaded file.

Example of usage:

    ./push-to-website.sh packer-output.txt

where `packer-output.txt` is the output file created by packer called
with the `-machine-readable` option enabled.


## Technical details

The following details about how the image is built are intended for
advanced users and developers. Regular users can just download the
image as discussed above.

- Packer is used to create and provision the image.
- The images are built from an Ubuntu 14.04 Server ISO directly from
  Canonical.
- For maximum user friendliness we use the LXDE window manager.
- FEniCS is installed from the FEniCS PPA packages
  (<https://launchpad.net/~fenics-packages>).
- dolfin-adjoint is installed from the libadjoint PPA packages
  (<https://launchpad.net/~libadjoint/>).
- Various helpful utilities such as gedit, Paraview, vim, and emacs
  are installed.


### FEniCS versions

FEniCS is installed from the FEniCS PPA
(<https://launchpad.net/~fenics-packages>).

dolfin-adjoint is installed from the libadjoint PPA
(<https://launchpad.net/~libadjoint/>).


### Provisioning

The image is provisioned by the Bash scripts in `scripts/'. They are
called in the order:

1. `update-apt.sh`       (run `apt-get update`)
2. `fenics.sh`           (add the FEniCS PPA and install `fenics` package)
3. `gui.sh`              (add GUI packages)
4. `utils.sh`            (add miscellaneous useful packages)
5. `cleanup.sh`          (clean `apt` cache and temp files)
6. `dolfin-examples.sh`  (copy DOLFIN examples into user directory)
