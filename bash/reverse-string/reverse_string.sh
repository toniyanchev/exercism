#!/usr/bin/env bash


  main () {
    input_string=$1
    input_length=${#input_string}

    export result=''
    export i=$input_length

    fill_result
  }

  fill_result() {
    if [ $i -eq 0 ]; then
        echo "$result"
        exit 0
    fi

    next_letter="${input_string:i-1:1}"
    result=$result$next_letter

    i=$((i-1))
    fill_result
  }

  # call main with all of the positional arguments
  main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***
