# Find the area and circumference of a circle.

#! /bin/bash

read -p "Enter radius of the circle: " r

area=$(( echo "scale=4; 3.1416*$r^2" ) | bc -l )
circumference=$(( echo "scale=4; 2*3.1416*$r ") | bc -l )

echo " Area of the circle is : $area"
echo "Circumference of the circle is : $circumference"
