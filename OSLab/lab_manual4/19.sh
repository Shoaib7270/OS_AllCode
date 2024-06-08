#!/bin/bash

# Read the number of elements
read -p "Enter the number of elements: " n

# Initialize an empty array
numbers=()

# Read the numbers into the array
for (( i=0; i<n; i++ )); do
  read -p "Enter the number: " num
  numbers+=($num)
done

# Sort the array in descending order
sorted_numbers=($(printf "%s\n" "${numbers[@]}" | sort -nr))

# Find the 2nd highest and 3rd highest numbers
second_highest=${sorted_numbers[1]}
third_highest=${sorted_numbers[2]}

# Calculate the sum of the 2nd highest and 3rd highest numbers
sum=$((second_highest + third_highest))

# Output the result
echo "The sum of the 2nd highest ($second_highest) and 3rd highest ($third_highest) numbers is: $sum"


#using function
#!/bin/bash

# Function to find the 2nd highest and 3rd highest numbers
find_2nd_3rd_highest() {
    local arr=("$@")
    local len=${#arr[@]}
    
    # Sort the array in descending order
    for ((i = 0; i < len; i++)); do
        for ((j = $i + 1; j < len; j++)); do
            if ((arr[i] < arr[j])); then
                # Swap elements if they are not in descending order
                temp=${arr[i]}
                arr[i]=${arr[j]}
                arr[j]=$temp
            fi
        done
    done

    # Display the 2nd highest and 3rd highest numbers
    echo "2nd highest number: ${arr[1]}"
    echo "3rd highest number: ${arr[2]}"
    
    # Calculate and display the sum of the 2nd and 3rd highest numbers
    sum=$((arr[1] + arr[2]))
    echo "The sum of 2nd and 3rd highest numbers is: ${arr[1]} + ${arr[2]} = $sum"
}

# Read the number of elements from the user
read -p "Enter the number of elements: " n

# Initialize an empty array to store the numbers
numbers=()

# Read the numbers from the user
for ((i = 0; i < n; i++)); do
    read -p "Enter the number: " num
    numbers+=("$num")
done

# Call the function to find the 2nd highest and 3rd highest numbers
find_2nd_3rd_highest "${numbers[@]}"
