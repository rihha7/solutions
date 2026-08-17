#!/usr/bin/env bash

# using_herestring TEXT, using_loop TEXT
# ---------------------
# Each function reverses the order of TEXT using different methods. 
#
# Parameters:
#   TEXT  Text to be reversed (can be empty)
#
# Exit Codes:
#   0  If successful

using_herestring() {
    rev <<< "$1"   # avoids 'echo "$1" | rev' as it requires another process
}

using_loop() {
    local text="$1" reversed=""
    local -r -i len=${#text}

    for (( i = len - 1; i >= 0; i-- )); do
        reversed+="${text:i:1}"
    done

    printf "%s\n" "$reversed"
}


# --- Test Case ---
text="Hello world!"
printf "reversing using a herestring: %s\n" "$(using_herestring "$text")"
printf "reversing using a loop: %s\n"       "$(using_loop "$text")"


# --- Uncomment below to process CLI arguments directly ---
# using_herestring "$@"
# using_loop "$@"
