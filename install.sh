#!/bin/bash

set -e

password_name=$1

# Password name must be specified. Fail if not
if [ -z "$password_name" ]; then
  echo 'Specify name for password - usage: ./install.sh my-lovely-password'
  exit 1
fi

set_password_filename="/Users/${USER}/Library/Scripts/${password_name}-set"
get_password_filename="/Users/${USER}/Library/Scripts/${password_name}"

# Interpolate into the 'set password' file and save into ~/Library/Scripts directory
sed "s/<some-password-key>/${password_name}/" ./set-password > "$set_password_filename"

# Interpolate into the 'get password' file and save into ~/Library/Scripts directory
sed "s/<some-password-key>/${password_name}/" ./get-password > "$get_password_filename"

# Make both executable
chmod +x "${set_password_filename}"
chmod +x "${get_password_filename}"

echo "Successfully installed ${set_password_filename} and ${get_password_filename}"

