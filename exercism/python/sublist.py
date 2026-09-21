"""
Each implementation determines the relationship between 2 lists.

If `list_one` is a sublist of `list_two`, returns `SUBLIST` (0).
If `list_two` is a sublist of `list_one`, returns `SUPERLIST` (1).
If `list_one` is identical to `list_two`, returns `EQUAL` (2).
If there is no relationship, returns `UNEQUAL` (-1).

Examples:
    >>> sublist_pointers([], [])
    EQUAL
    >>> sublist_pointers([1, 2, 3], [])
    SUPERLIST

Link:
    https://exercism.org/tracks/python/exercises/sublist
"""

SUBLIST = 0
SUPERLIST = 1
EQUAL = 2
UNEQUAL = -1


def sublist_slicing(list_one: list[object], list_two: list[object]) -> int:
    """Implements `sublist` using slicing, which creates temporary lists."""
    if (list_one == list_two):
        return EQUAL

    if (len(list_two) > len(list_one)):
        small, large, result = list_one, list_two, SUBLIST
    else:
        small, large, result = list_two, list_one, SUPERLIST
        
    return result if any(
        large[i:i+len(small)] == small
        for i in range(len(large) - len(small) + 1)
    ) else UNEQUAL


# -----


def contains_sublist(large: list[object], small: list[object]) -> bool:
    for i in range(len(large) - len(small) + 1):
        for j, elem in enumerate(small):
            if elem != large[i+j]:
                break
        else:
            return True

    return False


def sublist_pointers(list_one: list[object], list_two: list[object]) -> int:
    """Implements `sublist` using index-based comparisons via a helper function, and avoids creating temporary lists."""
    if (list_one == list_two):
        return EQUAL

    if (len(list_two) > len(list_one)):
        small, large, result = list_one, list_two, SUBLIST
    else:
        small, large, result = list_two, list_one, SUPERLIST
        
    return result if contains_sublist(large, small) else UNEQUAL
