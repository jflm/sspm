#!/bin/bash

set -e

test_files=$(ls tests | grep -v helper)

for test_file in "$test_files"; do
    bash "tests/$test_file"
done
