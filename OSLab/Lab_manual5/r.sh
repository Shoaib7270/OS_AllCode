#!/bin/bash

# Function to calculate the waiting time for each process
calculateWaitingTime() {
    local n=$1
    local bt=("$@")
    local wt=()

    # Initialize waiting time array with 0
    for ((i=0; i<$n; i++)); do
        wt[$i]=0
    done

    local quantum=2  # Set the time quantum

    local remaining=("$@")  # Remaining burst time for each process

    local t=0  # Current time

    # Continue the loop until all processes are executed
    while true; do
        local done=true  # Flag to check if all processes are done

        # Traverse all processes
        for ((i=0; i<$n; i++)); do
            # If burst time for this process is remaining
            if [ "${remaining[$i]}" -gt 0 ]; then
                done=false  # Mark as not all processes are done yet

                # If the remaining burst time is more than quantum, decrease it by quantum
                if [ "${remaining[$i]}" -gt "$quantum" ]; then
                    t=$((t + quantum))
                    remaining[$i]=$((remaining[$i] - quantum))
                else  # If remaining burst time is less than or equal to quantum
                    t=$((t + remaining[$i]))
                    wt[$i]=$((t - bt[$i]))
                    remaining[$i]=0
                fi
            fi
        done

        # Break the loop if all processes are done
        if $done; then
            break
        fi
    done

    # Print waiting time for each process
    for ((i=0; i<$n; i++)); do
        echo "Waiting Time for Process $i: ${wt[$i]}"
    done
}

# Main script starts here

# Take user input for number of processes
echo "Enter the number of processes:"
read n

# Take user input for burst time of each process
echo "Enter burst time for each process (space-separated):"
read -a burst_times

# Call function to calculate waiting time for each process
calculateWaitingTime "$n" "${burst_times[@]}"
