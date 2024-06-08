#!/bin/bash

# Function to count the occurrences of each digit
count_digits() {
  local number=$1
  declare -A digit_count  # Create an associative array for digit counts

  # Initialize the digit counts to 0
  for digit in {0..9}; do
    digit_count[$digit]=0
  done

  # Iterate over each character in the number
  while [ -n "$number" ]; do
    digit=${number:0:1}
    number=${number:1}
    digit_count[$digit]=$((digit_count[$digit] + 1))
  done

  # Display the counts of each digit
  for digit in {0..9}; do
    if [ ${digit_count[$digit]} -ne 0 ]; then
      echo "$digit = ${digit_count[$digit]} times"
    fi
  done
}

# Read the number from the user
read -p "Enter the number: " number

# Check if the input is a valid number
if [[ ! "$number" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a valid number."
  exit 1
fi

# Call the function to count and display the occurrences of each digit
count_digits "$number"






# without function
#!/bin/bash

# Read a number from the user
read -p "Enter the number: " number

# Initialize an array to store the count of each digit (0-9)
declare -a count=(0 0 0 0 0 0 0 0 0 0)

# Iterate over each digit in the number and update the count
i=0
while [ $i -lt ${#number} ]; do
  digit=${number:$i:1}
  count[$digit]=$((count[$digit] + 1))
  i=$((i + 1))
done

# Display the frequency of each digit that appears in the number
echo "Digit frequencies:"
for i in {0..9}; do
  if [ ${count[$i]} -gt 0 ]; then
    echo "$i = ${count[$i]} times"
  fi
done

