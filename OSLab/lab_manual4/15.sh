#! /bin/bash

find_sum() {
	sum=$(($1+$2))
	echo "The sum of these parameters is : $sum"
}
read -p "Enter the 1st number: " number1
read -p "Enter the 2nd number: " number2

find_sum $number1 $number2
