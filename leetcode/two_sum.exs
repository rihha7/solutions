defmodule Solution do
  @module_doc """
  [1] Two Sum

  You are given an array of integers `nums` and an integer `target`.
  Return the indices of two numbers in `nums`, such that they add up to target.
  You may assume that each input would have exactly one solution, and you may not use the same element twice.
  You can return the answer in any order.
    -109 <= target <= 109

  Can you come up with an algorithm that is less than O(n^2) time complexity?

  Link: https://leetcode.com/problems/two-sum/
  """
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]

  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> Enum.reduce_while(%{}, fn {num, idx}, map ->
      case Map.get(map, num) do # or check pair `case map[target - num]` and store current
        nil -> {:cont, Map.put(map, target - num, idx)} # stores pair using current index as value
        idx2 -> {:halt, [idx, idx2]}
      end
    end)
    # |> case do   # redudant as each input has exactly one solution
    #   result when is_list(result) -> result
    #   _map -> [-1]
    # end
  end
end
