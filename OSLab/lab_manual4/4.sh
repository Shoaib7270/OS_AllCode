#!/bin/bash

evensum=0
oddsum=0

read  -p "Enter numbers separated by spaces : " -a numbers

for number in "${numbers[@]}"; do 
	if (( number%2 == 0 )); then
		evensum=$(( evensum+number ))
	else 
		oddsum=$((oddsum+number))
	fi
done

echo "Sum of even numbers: $evensum"
echo "Sum of odd numbers: $oddsum"
