#!/bin/bash

# Function to find the least recently used page
find_lru() {
    local -n arr=$1
    local -n ref=$2
    local oldest=${arr[0]}
    local oldest_index=0

    for ((i=1; i<${#arr[@]}; i++)); do
        if [[ ${ref[${arr[i]}]} -lt ${ref[$oldest]} ]]; then
            oldest=${arr[i]}
            oldest_index=$i
        fi
    done

    echo $oldest_index
}

# Read input: number of frames and page references
read -p "Enter number of frames: " num_frames
read -p "Enter page reference string (space-separated): " -a pages

# Initialize
declare -a frames=()
declare -A last_used
page_faults=0

for ((i=0; i<${#pages[@]}; i++)); do
    page=${pages[$i]}

    # Check if page is already in frames
    in_frames=0
    for frame in "${frames[@]}"; do
        if [[ $frame -eq $page ]]; then
            in_frames=1
            break
        fi
    done

    if [[ $in_frames -eq 0 ]]; then
        # Page fault occurred
        ((page_faults++))

        if [[ ${#frames[@]} -lt $num_frames ]]; then
            # If there's space in frames, add the page
            frames+=($page)
        else
            # Find the LRU page and replace it
            lru_index=$(find_lru frames last_used)
            frames[$lru_index]=$page
        fi
    fi

    # Update last used time for the current page
    last_used[$page]=$i

    # Print current state of frames
    echo "Page reference: $page"
    echo "Frames: ${frames[@]}"
    echo "Page faults: $page_faults"
    echo "----"
done

echo "Total page faults: $page_faults"
