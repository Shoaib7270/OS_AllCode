#!/bin/bash

# Function to display numbers in odd positions
display_odd_positions() {
  local numbers=("$@")  # Read all arguments into an array
  local length=${#numbers[@]}  # Get the length of the array

  echo "Numbers in odd positions:"
  for (( i=0; i<length; i++ )); do
    # Check if the position is odd (array index starts from 0, so add 1)
    if (( (i + 1) % 2 != 0 )); then
      echo "${numbers[$i]}"
    fi
  done
}

# Read numbers from the user into an array
echo "Enter numbers separated by spaces:"
read -a numbers

# Call the function to display numbers in odd positions
display_odd_positions "${numbers[@]}"
