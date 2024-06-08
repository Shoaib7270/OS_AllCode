#!/bin/bash

echo "Enter the number of processes: "
read n
echo

# Arrays to store process details
declare -a pid  # Process ID
declare -a at   # Arrival Time
declare -a bt   # Burst Time
declare -a ct   # Completion Time
declare -a wt   # Waiting Time
declare -a tat  # Turnaround Time

# Read process details
for ((i=0; i<n; i++))
do
  echo "Enter Arrival Time for process $i: "
  read at[$i]
  echo "Enter Burst Time for process $i: "
  read bt[$i]
  pid[$i]=$i
done

# Sort processes based on arrival time
for ((i=0; i<n-1; i++))
do
  for ((j=0; j<n-i-1; j++))
  do
    if [ ${at[$j]} -gt ${at[$(($j+1))]} ]
    then
      # Swap arrival time
      temp=${at[$j]}
      at[$j]=${at[$(($j+1))]}
      at[$(($j+1))]=$temp
      
      # Swap burst time
      temp=${bt[$j]}
      bt[$j]=${bt[$(($j+1))]}
      bt[$(($j+1))]=$temp
      
      # Swap process ID
      temp=${pid[$j]}
      pid[$j]=${pid[$(($j+1))]}
      pid[$(($j+1))]=$temp
    fi
  done
done

# Calculate completion time for each process
ct[0]=${bt[0]}
for ((i=1; i<n; i++))
do
  ct[$i]=$((ct[$(($i-1))] + bt[$i]))
done

# Calculate waiting time for each process
for ((i=0; i<n; i++))
do
  wt[$i]=$((ct[$i] - at[$i] - bt[$i]))
done

# Calculate turnaround time for each process
for ((i=0; i<n; i++))
do
  tat[$i]=$((ct[$i] - at[$i]))
done

# Display process details
echo -e "\nPROCESS\t\tARRIVAL TIME\tBURST TIME\tWAITING TIME\tTURNAROUND TIME"
for ((i=0; i<n; i++))
do
  echo -e "P${pid[$i]}\t\t${at[$i]}\t\t${bt[$i]}\t\t${wt[$i]}\t\t${tat[$i]}"
done

# Calculate average waiting time
wtsum=0
for ((i=0; i<n; i++))
do
  wtsum=$((wtsum + wt[$i]))
done
wtavg=$(echo "scale=2; $wtsum / $n" | bc)

# Calculate average turnaround time
tatsum=0
for ((i=0; i<n; i++))
do
  tatsum=$((tatsum + tat[$i]))
done
tatavg=$(echo "scale=2; $tatsum / $n" | bc)

# Display average waiting and turnaround time
echo -e "\nAverage Waiting Time: $wtavg"
echo "Average Turnaround Time: $tatavg"
