import Bitwise

defmodule Solution do
  @moduledoc """
  [2401] Longest Nice Subarray

  You are given an array nums consisting of positive integers.
  A subarray of nums is "nice" if the bitwise AND of EVERY pair of elements that are in different positions in the subarray is equal to 0.

  Return the length of the longest nice subarray.

  Example:
    Solution.longest_nice_subarray([1,3,8,48,10])
    => 3 (longest nice subarray is [3,8,48] as 3 AND 8 = 0 and also 3 AND 8 AND 48 = 0)

  Link: https://leetcode.com/problems/longest-nice-subarray
  """
  @spec longest_nice_subarray(nums :: [integer]) :: integer
  def longest_nice_subarray(nums) do
    t = List.to_tuple(nums)

    Enum.with_index(nums)
    |> Enum.reduce({0, 0, 0}, fn {n, right}, {left, mask, best} ->
      {left, mask} = 
        shrink(t, left, mask, n)

      {left, bor(mask, n), max(best, right - left + 1)}
    end)
    |> elem(2)
  end

  defp shrink(nums_t, left, mask, n) do
    case mask &&& n do
      0 -> {left, mask}
      _ -> shrink(nums_t, left + 1, bxor(mask, elem(nums_t, left)), n)
    end
  end
end
