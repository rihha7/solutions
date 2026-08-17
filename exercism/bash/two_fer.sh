#!/usr/bin/env bash

# main NAME
# ---------------------
# Outputs "One for NAME, one for me." if NAME is known, else output is "One for you, one for me.".
#
# Parameters:
#   NAME  Name of person to use in "two fer" phrase (input is optional)
#
# Exit Codes:
#   0  If successful

main() {
    printf "%s\n" "One for ${1:-you}, one for me."
}


# --- Test Cases ---
name_a=""
name_b="Bee"
printf "Empty string: %s\n" "$(main "$name_a")"
printf "Name 'Bee': %s\n"   "$(main "$name_b")"
printf "No input: %s\n"     "$(main)"


# --- Uncomment below to process CLI arguments directly ---
# main "$@"
