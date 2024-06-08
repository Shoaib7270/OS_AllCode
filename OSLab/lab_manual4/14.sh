#! /bin/bash

find_largest() {
	if (($1 > $2)); then
		echo "$1 is the largest number."
	else
		echo "$2 is the largest number."
	fi
}

read -p "Enter the 1st number: " number1
read -p "Enter the 2nd number: " number2

find_largest $number1 $number2
