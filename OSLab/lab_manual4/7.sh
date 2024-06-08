#! /bin/bash

read -p "Enter numbers: " -a numbers
lowest=10000000
sec_lowest=1000000000

for number in "${numbers[@]}"; do
	if (( number<lowest ));then
		sec_lowest=$lowest
		lowest=$number
	elif (( number < sec_lowest && number != lowest )); then
		sec_lowest=$number
	fi
done
echo "The second Lowest number is :  $sec_lowest"
		
