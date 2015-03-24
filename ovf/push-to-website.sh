#!/bin/bash
echo "Parsing $1 for packer artifact information..."
artifact_line=`cat $1 | grep 'artifact,0,file,0'`
IFS=',' read -ra arr <<< "$artifact_line"
artifact=${arr[6]}
echo "Found artifact at $artifact"
echo "Uploading artifact to http://fenicsproject.org/pub/virtual/..."
scp $artifact fenic-web@fenicsproject.org:pub/virtual/
echo "Successfully uploaded artifact."
