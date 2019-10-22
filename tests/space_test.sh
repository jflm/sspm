#!/bin/bash
source tests/test_helpers

# set -x

function cleanup {
    security delete-generic-password -a ${USER} -s ${PASSWORD_KEY} > /dev/null 2>&1
}

assert "true" == "true"

# manually set a password with a space in
security delete-generic-password -a ${USER} -s "random_test_password_key_hopefully_unique" > /dev/null 2>&1
security add-generic-password -a ${USER} -s "random_test_password_key_hopefully_unique" -w "A Password Yes"

# grab the script and put in the key, then execute it
eval $(sed "s/<some-password-key>/random_test_password_key_hopefully_unique/" ./get-password | grep -v bash)
returned_password=$(pbpaste)

assert "'$returned_password'" = "'A Password Yes'"

trap cleanup EXIT
