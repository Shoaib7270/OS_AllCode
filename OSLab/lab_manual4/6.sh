#! /bin/bash

read -p "Enter the numbers: " -a numbers

highest=0
second_highest=0

for number in "${numbers[@]}"; do
	if (( number > highest )); then
		second_highest=$highest
		highest=$number
	elif (( number > second_highest && number != highest )); then
		second_highest=$number
	fi
done

echo "The second highest number is : $second_highest"
		
