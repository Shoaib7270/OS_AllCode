#!/bin/bash

# Initialize sum and count variables
sum=0
count=0

# Function to calculate the average
calculate_average() {
  if [ $count -eq 0 ]; then
    echo "No numbers entered. Cannot calculate average."
  else
    average=$(echo "scale=2; $sum / $count" | bc)
    echo "The average of the entered numbers is: $average"
  fi
}

# Read numbers from the user
echo "Enter numbers one by one. Type 'done' to finish and calculate the average."

while true; do
  read -p "Enter a number (or 'done' to finish): " input

  # Check if the user wants to finish
  if [ "$input" = "done" ]; then
    break
  fi

  # Check if the input is a valid number
  if ! [[ "$input" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input. Please enter a valid number."
    continue
  fi

  # Add the valid number to the sum and increment the count
  sum=$(echo "$sum + $input" | bc)
  count=$((count + 1))
done

# Calculate and display the average
calculate_average
