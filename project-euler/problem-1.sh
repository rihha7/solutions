#!/usr/bin/env bash

# Multiples of 3 or 5

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6, and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.


# METHOD 1:
declare -ra MULTIPLES_OF_3_OR_5=( {3..999..3} {5..995..5} ) # avoids for looping to 1000 for efficiency

printf '%s\n' "${MULTIPLES_OF_3_OR_5[@]}" | sort -nu | awk '{ sum += $1 } END { print sum }'
# or: sort -nu <(printf '%s\n' "${MULTIPLES_OF_3_OR_5[@]}") | awk '{ sum += $1 } END { print sum }'

# --------------------------------

# METHOD 2:
declare -ri LIMIT=999

sum_of_multiples() {
    local -ri N=$(( LIMIT / $1 ))
    local -ri sum_of_first_N_natural_numbers=$(( N * (N + 1) / 2 ))
    echo $(( $1 * sum_of_first_N_natural_numbers ))
}

echo $(( $(sum_of_multiples 5) + $(sum_of_multiples 3) - $(sum_of_multiples 15) ))
