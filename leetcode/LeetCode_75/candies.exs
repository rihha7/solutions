defmodule Solution do
  @moduledoc """
  [1431] Kids With the Greatest Number of Candies (3/75)

  You are given an integer array `candies`, and an integer `extraCandies`.
  Return a boolean array result of length n, where `result[i]` is true if after giving the `i`th kid all the extraCandies, they will have the greatest number of candies among all the kids, or false otherwise.

  Note that multiple kids can have the greatest number of candies.

  Examples:
    kids_with_candies([2,3,5,1,3], 3)
    => [true,true,true,false,true] (2+3, 3+3, 5+3, 3+3 are all >= 5 (max) whereas 1+3 < 5)

    kids_with_candies([4,2,1,1,2], 1)
    => [true,false,false,false,false] (4+1 is the only value >= 4 (max), whereas 2+1, 1+1, 1+1, 2+1 are all < 4)

  Link: https://leetcode.com/problems/kids-with-the-greatest-number-of-candies
  """
  @spec kids_with_candies(candies :: [integer], extra_candies :: integer) :: [boolean]
  def kids_with_candies(candies, extra_candies) do
    do_check(Enum.max(candies), candies, extra_candies, [])
  end

  defp do_check(_, [], _, acc), do: Enum.reverse(acc)
  defp do_check(max, [head|tail], extra, acc),
    do: do_check(max, tail, extra, [head + extra >= max|acc]) 


  def kids_with_candies2(candies, extra_candies) do
    max = Enum.max(candies)
    Enum.map(candies, &(&1 + extra_candies >= max))
  end
end
