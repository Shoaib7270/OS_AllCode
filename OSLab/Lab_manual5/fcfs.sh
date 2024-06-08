#!/bin/bash

# Function to calculate waiting time and turnaround time for each process
calculate_times() {
    local n=$1
    for ((i=0; i<n; i++))
    do
        if ((i == 0)); then
            wt[$i]=0
        else
            wt[$i]=$((tat[$((i-1))]))
        fi
        tat[$i]=$((bt[$i] + wt[$i]))
        wtavg=$((wtavg + wt[$i]))
        tatavg=$((tatavg + tat[$i]))
    done
}

# Main code
echo "Enter the number of processes: "
read n

# Arrays to store burst time, waiting time, and turnaround time
declare -a bt wt tat

# Variables to store average waiting time and average turnaround time
wtavg=0
tatavg=0

# Input burst time for each process
for ((i=0; i<n; i++))
do
    echo "Enter the Burst Time for process $i: "
    read bt[$i]
done

# Calculate waiting time and turnaround time
calculate_times $n

# Output results
echo -e "\nPROCESS\t\tBURST TIME\tWAITING TIME\tTURNAROUND TIME"
for ((i=0; i<n; i++))
do
    echo -e "P$i \t\t ${bt[$i]} \t\t ${wt[$i]} \t\t ${tat[$i]}"
done

# Calculate and output average waiting time and average turnaround time
echo -e "\n\nAverage Waiting Time --> $(bc -l <<< "${wtavg}/${n}")"
echo -e "Average Turnaround Time --> $(bc -l <<< "${tatavg}/${n}")"
