#!/bin/bash

# Function to calculate factorial
factorial() {
    local n=$1
    local result=1
    
    # Calculate factorial
    for ((i = 1; i <= n; i++)); do
        result=$((result * i))
    done
    
    echo $result
}

# Read the numbers
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Calculate factorials
fact1=$(factorial $num1)
fact2=$(factorial $num2)

# Calculate sum
sum=$((fact1 + fact2))

# Output the result
echo "Factorial of $num1 is $fact1"
echo "Factorial of $num2 is $fact2"
echo "$fact1 + $fact2 = $sum"
