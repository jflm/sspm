#!/bin/bash

set -e

for test_file in ./tests/*; do
    bash "$test_file"
done
