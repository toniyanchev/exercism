#!/usr/bin/env bash

number=$1

if [ -z "$number" ]; then
    echo 'false'
    exit 0
fi


total=0
for (( i=0; i<${#number}; i++ )); do
  n_powered=$(echo "${number:$i:1}^${#number}" | bc)
  total=$((total+n_powered))
done

if [ "$number" -eq "$total" ]; then
    echo 'true'
else
    echo 'false'
fi

exit 0
