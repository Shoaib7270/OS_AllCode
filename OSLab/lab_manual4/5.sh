#!/bin/bash

smtnumber=100000

read  -p "Enter numbers separated by spaces :  " -a numbers
for number in "${numbers[@]}"; do
	if [ $number -lt $smtnumber ]; then
		smtnumber=$number
	fi
done

echo "The smallest number is : $smtnumber"

for number in "${numbers[@]}"; do
	if (( number < smtnumber )); then
		smtnumber=$number
	fi
done
echo "The smallest number is : $smtnumber"
