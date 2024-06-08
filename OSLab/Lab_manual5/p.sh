#!/bin/bash

# Function to execute a process
execute_process() {
    echo "Executing Process $1"
    sleep 1  # Simulating process execution time
}

# Main function for Priority CPU Scheduling
priority_scheduling() {
    # Associative array to store processes and their priorities
    declare -A processes

    # Read number of processes from user
    read -p "Enter the number of processes: " num_processes

    # Read processes and priorities from user
    for ((i = 1; i <= num_processes; i++)); do
        read -p "Enter Process $i name: " process_name
        read -p "Enter Process $i priority (higher number means higher priority): " priority
        processes["$process_name"]=$priority
    done

    # Sort processes based on priority
    sorted_processes=$(for process in "${!processes[@]}"; do
        echo "$process ${processes[$process]}"
    done | sort -k2nr | cut -d' ' -f1)

    # Execute processes based on priority
    for process in $sorted_processes; do
        execute_process "$process"
    done
}

# Call the priority scheduling function
priority_scheduling
