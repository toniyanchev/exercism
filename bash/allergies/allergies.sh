#!/usr/bin/env bash

if [ -z $1 ]; then
    exit 0
fi

score=$(($1 % 256))
action=$2
check_allergy=$3

declare -a allergies_map=(
    [1]="eggs"
    [2]="peanuts"
    [4]="shellfish"
    [8]="strawberries"
    [16]="tomatoes"
    [32]="chocolate"
    [64]="pollen"
    [128]="cats"
)

current_score=0
available_allergies=()

if [ "$(($score-$current_score))" -ge 128 ]; then    # cats 128
    available_allergies+=("cats")
    current_score=$(($current_score + 128))
fi
if [ "$(($score-$current_score))" -ge 64 ]; then    # pollen 64
    available_allergies+=("pollen")
    current_score=$(($current_score + 64))
fi
if [ "$(($score-$current_score))" -ge 32 ]; then    # chocolate 32
    available_allergies+=("chocolate")
    current_score=$(($current_score + 32))  
fi
if [ "$(($score-$current_score))" -ge 16 ]; then    # tomatoes 16
    available_allergies+=("tomatoes")
    current_score=$(($current_score + 16))
fi
if [ "$(($score-$current_score))" -ge 8 ]; then    # strawberries 8
    available_allergies+=("strawberries")
    current_score=$(($current_score + 8))  
fi
if [ "$(($score-$current_score))" -ge 4 ]; then    # shellfish 4
    available_allergies+=("shellfish")
    current_score=$(($current_score + 4))   
fi
if [ "$(($score-$current_score))" -ge 2 ]; then    # peanuts 2
    available_allergies+=("peanuts")
    current_score=$(($current_score + 2))
fi
if [ "$(($score-$current_score))" -ge 1 ]; then    # eggs 1
    available_allergies+=("eggs")
    current_score=$(($current_score + 1))
fi

reversed_available_allergies=($(printf "%s\n" "${available_allergies[@]}" | tac))

if [[ "$action" == "allergic_to" ]]; then
    if [[ ${reversed_available_allergies[@]} =~ "$check_allergy" ]]; then
        echo 'true'
    else
        echo 'false'
    fi
    exit 0  
fi
if [[ "$action" == "list" ]]; then
    echo "${reversed_available_allergies[@]}"
    exit 0
fi
