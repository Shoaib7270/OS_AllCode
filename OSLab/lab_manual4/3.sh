#! /bin/bash

read -p "Enter num1 : " n1
read -p "Enter num2 : " n2
read -p "Enter num3 : " n3

if ((n1>n2 && n1>n3)); then
	echo "num1 is greater."
elif ((n2>n1 && n2>n3)); then
	echo "num2 is greater"
else
	echo "num3 is greater"
fi
