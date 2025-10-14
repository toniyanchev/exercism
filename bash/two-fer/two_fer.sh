#!/usr/bin/env bash

# set -f 
name="$1"

if [ -z "$name" ]; then
    name=you
fi

echo "One for "$name", one for me."