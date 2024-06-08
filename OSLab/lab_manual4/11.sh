#! /bin/bash

read -p "Enter a number: " number

largest_digit=-1
sec_largest_digit=-1

while (( number > 0 )); do
	digit=$((number % 10))
	number=$((number / 10))
	
	if (( digit > largest_digit )); then
		sec_largest_digit=$largest_digit
		largest_digit=$digit
	elif (( digit > sec_largest_digit && digit != largest_digit )); then
		sec_largest_digit=$digit
	fi
	
done
echo "The second largest digit is: $sec_largest_digit"
