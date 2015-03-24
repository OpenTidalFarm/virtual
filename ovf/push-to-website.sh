#!/bin/bash
# This script will upload the OVA created by packer to the FEnics website
# and make a symlink from fenics-latest.ova to the uploaded file.
# Author: Jack S. Hale

BAD="\033[1;37;41m"
GOOD="\033[1;37;42m"
BOLD="\033[1m"

# Function for printing messages
cecho()
{
    COL=$1; shift
    echo -e "${COL}$@\033[0m"
}

if [ $1 == "-h" ] || [ $1 == "--help" ]; then
    echo "This helper script will upload the created packer OVA artifact to the FEniCS website"
    echo "and make a symlink from fenics-latest.ova to the uploaded file."
    echo ""
    echo "Example usage:"
    echo "  packer -machine-readable build fenics.json | tee packer-output.txt"
    echo "  ./push-to-website.sh packer-output.txt"
    exit 0
fi

if [ -z "$1" ]; then
    echo "You must pass a filename containing the output of, e.g.:" 
    echo "vagrant -machine-readable build fenics.json | tee packer-output.txt"
    echo "to this script." 
    exit 1    
fi

if [ ! -f "$1" ]; then
    cecho $BAD "File $1 does not exist."
    exit 1
fi

echo "Parsing $1 for packer artifact information..."
artifact_line=`cat $1 | grep 'artifact,0,file,0'`
IFS=',' read -ra arr <<< "$artifact_line"
artifact=${arr[6]}
artifact_file=${artifact##*/}

cecho $GOOD "Found artifact at $artifact"

echo "Uploading artifact to http://fenicsproject.org/pub/virtual/$artifact_file ..."
if [ `scp $artifact fenic-web@fenicsproject.org:pub/virtual/` ]; then
    cecho $GOOD "Successfully uploaded artifact."
else
    cecho $BAD "Failed to upload artifact."
    exit 1
fi

echo "Creating symlink from pub/virtual/fenics-latest.ova to pub/virtual/$artifact_file ..."
if [ `ssh fenics-web@fenicsproject.org "cd pub/virtual/; ln -sf $artifact_file fenics-latest.ova"` ]; then
    cecho $GOOD "Created symlink."
else
    cecho $GOOD "Failed to create symlink."
    exit 1
fi

cecho $GOOD "Success! OVA was pushed and successfully symlinked."
