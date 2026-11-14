defmodule Solution do
  @moduledoc """
  [704] Binary Search

  Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums.
  If target exists, then return its index. Otherwise, return -1.
  You must write an algorithm with O(log n) runtime complexity.

  Example:
    search([-1,0,3,5,9,12], 9)
    => 4 (target 9 exists in nums and its index is 4)

  Link: https://leetcode.com/problems/binary-search/description/
  """
  @spec search(nums :: [integer], target :: integer) :: integer
  def search(nums, target) do
    t_nums = List.to_tuple(nums)
    binary_search(t_nums, target, 0, tuple_size(t_nums) - 1)
  end

  defp binary_search(_, _, left, right) when left > right, do: -1

  defp binary_search(t_nums, target, left, right) do
    mid_idx = div(left + right, 2)
    mid_val = elem(t_nums, mid_idx)

    cond do
      mid_val == target -> mid_idx
      target > mid_val -> binary_search(t_nums, target, mid_idx + 1, right)
      target < mid_val -> binary_search(t_nums, target, left, mid_idx - 1)
    end
  end

  # List.to_tuple/1 is a O(n) space BUT O(n) time operation (O(n) + O(log n) = O(n)), violating the O(log n) time complexity requirement.
  # Enum.at/2 on a linked list is a O(n) operation, making the overall complexity O(n) instead of O(log n).
end
