#!/bin/bash

# Function to prompt user input
prompt_input() {
  echo "Enter the number of frames:"
  read num_frames

  echo "Enter the sequence of page references (space-separated):"
  read -a page_references
}

# Function to perform FIFO page replacement
fifo_page_replacement() {
  local -n pages=$1
  local frames=$2
  local page_faults=0

  # Initialize an empty queue
  queue=()
  
  for page in "${pages[@]}"; do
    # Check if the page is already in the queue
    if [[ " ${queue[@]} " =~ " ${page} " ]]; then
      echo "Page $page already in memory: ${queue[@]}"
    else
      # Page fault occurs
      ((page_faults++))
      
      # If the queue is full, remove the first element
      if (( ${#queue[@]} >= frames )); then
        removed=${queue[0]}
        queue=("${queue[@]:1}")
        echo "Page $removed removed from memory"
      fi
      
      # Add the new page to the queue
      queue+=("$page")
      echo "Page $page added to memory: ${queue[@]}"
    fi
  done

  echo "Total page faults: $page_faults"
}

# Main script execution
prompt_input
fifo_page_replacement page_references $num_frames
