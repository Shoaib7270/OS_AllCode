#! /bin/bash

read -p "Enter a number: " number

sum=0

while (( number > 0 )); do
	digit=$((number % 10))
	number=$((number / 10))
	
	sum=$((sum+digit))	
done

echo "The sum of all digits of a number is: $sum"
