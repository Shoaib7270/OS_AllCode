#! /bin/bash

read -p "Enter a number: " number

smt_digit=9

while (( number > 0 )); do
	digit=$((number % 10))
	number=$((number / 10))
	
	if (( digit < smt_digit )); then
		smt_digit=$digit
	fi	
done

echo "The smallest digit is: $smt_digit"
