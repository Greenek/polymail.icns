#!/usr/bin/env bash

# Exit on errors
set -o errexit
set -o nounset

# Constants
URL=https://raw.githubusercontent.com/Greenek/polymail.icns/master/Polymail.icns

# Check if operating system is supported
if [[ $OSTYPE != "darwin"* ]]; then
  echo "This script requires OSX system to run."
  exit 1
fi

# Check if Polymail.app is installed
: ${POLYMAIL_PATH:="/Applications/Polymail.app"}

if [ ! -d "$POLYMAIL_PATH" ]; then
  echo "Polymail.app not found."
  exit 1
fi

# Initialize temporary files paths
TMPICNS=$TMPDIR"Polymail.icns"
TMPRSRC=$TMPDIR"icon.rsrc"

if [ $# -eq 0 ]; then
  # Download icon file if path has not been passed in argument
  curl -L -o $TMPICNS $URL
else
  cp -f $1 $TMPICNS
fi

# Add icon to image file
sips -i $TMPICNS >> /dev/null

# Take icon and put into a rsrc file
DeRez -only icns $TMPICNS > $TMPRSRC

# Apply the rsrc file
SetFile -a C $POLYMAIL_PATH

# Remove old resource
rm -f $POLYMAIL_PATH/Icon?

# Append icon resource
Rez $TMPRSRC -o $POLYMAIL_PATH/$'Icon\r'
SetFile -a V $POLYMAIL_PATH/Icon?

# Clean
rm $TMPRSRC $TMPICNS

# Success output
cat << EOF
New icon for Polymail.app has been successfully installed.

TO COMPLETE INSTALLATION:

1) Restart application

or

2) Clear system icon cache

sudo find /private/var/folders/ -name com.apple.dock.iconcache -exec rm {} \;
sudo find /private/var/folders -name com.apple.iconservices -exec rm -rf {} \;
killall Dock
EOF
