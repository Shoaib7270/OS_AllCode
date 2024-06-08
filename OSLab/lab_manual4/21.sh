#!/bin/bash

# Read the string from the user
read -p "Enter the string: " input_string

# Initialize counts
alphabets_count=0
digits_count=0
special_chars_count=0

# Iterate over each character in the string
for (( i=0; i<${#input_string}; i++ )); do
    char="${input_string:i:1}"  # Get the character at index i
    
    # Check if the character is an alphabet
    if [[ "$char" =~ [[:alpha:]] ]]; then
        ((alphabets_count++))
    # Check if the character is a digit
    elif [[ "$char" =~ [[:digit:]] ]]; then
        ((digits_count++))
    else
        ((special_chars_count++))
    fi
done

# Output the counts
echo "Alphabets = $alphabets_count"
echo "Digits = $digits_count"
echo "Special characters = $special_chars_count"
