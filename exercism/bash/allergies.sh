#!/usr/bin/env bash

# allergies.sh $1 $2 $3
# ----------------------------
# Each allergen and its score:
#    eggs (1)
#    peanuts (2)
#    shellfish (4)
#    strawberries (8)
#    tomatoes (16)
#    chocolate (32)
#    pollen (64)
#    cats (128)
#
# Ignores allergens that score 256, 512, 1024, etc.
#
# Parameters:
#    $1  User's allergy score i.e., the sum of scores of their allergies (required)
#
#    $2  Operation (required)
#        "list"         returns user's allergies as a space-separated string
#        "allergic_to"  returns "true" if user is allergic to $3, otherwise returns "false"
#
#    $3  The item to be tested when $2 is "allergic_to" (required if $2 is "allergic_to")
#
# Exit Status:
#    0   Script successful
#    1   Invalid arguments


fail() { echo "$1" >&2; exit 1; }

if [[ -z $1 ]]; then fail "missing allergy score"; fi
if [[ -z $2 ]]; then fail "missing operation"; fi
if (( $1 < 0 )); then fail "invalid negative argument: \"$1\""; fi

declare -ri SCORE=$(( $1 & 255 )) # allergy score
declare -ra ITEMS=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
declare -a allergens=()

for i in "${!ITEMS[@]}"; do
    if (( SCORE & (1 << i) )); then
        allergens+=( "${ITEMS["$i"]}" )
    fi
done

case "$2" in
    allergic_to)
        if [[ -z $3 ]]; then fail "missing item to test"; fi
        for allergen in "${allergens[@]}"; do
            [[ $allergen == "$3" ]] && { echo "true"; exit 0; }
        done
        echo "false"
        ;;
        
    list)
        echo "${allergens[*]}"
        ;;
    *)
        fail "invalid argument: \"$2\""
        ;;
esac

