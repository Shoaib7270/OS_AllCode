#! /bin/bash

read -p "Enter the number : " number
original_number=$number
n=${#number}

while (( number > 0)); do
	digit=$((number%10))
	number=$((number/10))
	power=1
	
	for ((i=0; i<n;i++)); do
		power=$((power*digit))
	done
	sum=$((sum+power))
done

if (( sum == original_number )); then
	echo "It is an armstrong number."
else
	echo "It is not an armstrong number."
fi
