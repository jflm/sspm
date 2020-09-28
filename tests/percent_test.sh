#!/bin/bash

source tests/test_helpers

TEST_PASSWORD_KEY="random_test_password_key_hopefully_unique_2"

function cleanup {
    security delete-generic-password -a ${USER} -s ${TEST_PASSWORD_KEY} > /dev/null 2>&1
}

# manually set a password with a space in
security delete-generic-password -a ${USER} -s ${TEST_PASSWORD_KEY} > /dev/null 2>&1
security add-generic-password -a ${USER} -s ${TEST_PASSWORD_KEY} -w "lovely%Elephant5"

# grab the script and put in the key, then execute it
copy_and_exec ./get-password "<some-password-key>" "${TEST_PASSWORD_KEY}"
returned_password=$(pbpaste)

assert "'$returned_password'" = "'lovely%Elephant5'"

trap cleanup EXIT
