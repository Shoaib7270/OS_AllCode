#!/bin/bash

# Prompt the user for the starting number
read -p "Enter the starting number:" start
read -p "Enter the ending number:" end

sum=0

for ((i=start; i<=end; i++))
do
    if ((i % 3 == 0 && i % 5 != 0))
    then
        sum=$((sum + i))
    fi
done

echo "The sum of all numbers between $start and $end that are divisible by 3 and not divisible by 5 is: $sum"
