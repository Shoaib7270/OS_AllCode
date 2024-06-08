#! /bin/bash

for i in 1 2 3 4 5 
do
	echo "welcome $i times"
done


for i in {1..10} 
do
	echo "welcome $i times"
done

for ((i=1; i<=100; i+=2)); do
	if (( i >= 5 && i <= 30)); then
		echo "$i"
	fi
done

