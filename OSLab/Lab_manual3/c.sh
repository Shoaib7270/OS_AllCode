#!/bin/bash

read -p "Enter the length of the rectangle : " length

read -p "Enter the width of the rectangle : " width

area=$((length * width))
perimeter=$((2 * (length + width)))

echo "The area of the rectangle is: $area"
echo "The perimeter of the rectangle is: $perimeter"
