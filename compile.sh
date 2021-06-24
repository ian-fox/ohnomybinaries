#!/bin/sh

# Set up some helpful variables
CNI=${CNI:-docker}
UTIL_IMAGE=ohnomybinaries-util

# Make sure the util image exists
if ! ${CNI} image inspect ${UTIL_IMAGE} &>/dev/null; then
  echo "Image ${UTIL_IMAGE} not found, have you built it using the Makefile?"
  exit 1
fi

${CNI} run --rm -v ${PWD}:/build --privileged ${UTIL_IMAGE} $@

