#!/bin/bash

read -p "Enter coefficient a : " a

read -p "Enter coefficient b : " b

read -p "Enter coefficient c : " c

# Calculate the discriminant
discriminant=$((b*b - 4*a*c))

# Check if the discriminant is negative, zero, or positive
if [ $discriminant -lt 0 ]; then
    echo "The equation has complex roots."
    realPart=$(echo "scale=2; -$b / (2 * $a)" | bc)
    imaginaryPart=$(echo "scale=2; sqrt(-$discriminant) / (2 * $a)" | bc)
    echo "Root 1: $realPart + ${imaginaryPart}i"
    echo "Root 2: $realPart - ${imaginaryPart}i"
elif [ $discriminant -eq 0 ]; then
    root=$(echo "scale=2; -$b / (2 * $a)" | bc)
    echo "The equation has one real root: $root"
else
    root1=$(echo "scale=2; (-$b + sqrt($discriminant)) / (2 * $a)" | bc)
    root2=$(echo "scale=2; (-$b - sqrt($discriminant)) / (2 * $a)" | bc)
    echo "Root 1: $root1"
    echo "Root 2: $root2"
fi
