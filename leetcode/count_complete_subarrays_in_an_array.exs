defmodule Solution do
  @moduledoc """
  [2799] Count Complete Subarrays In An Array

  Given an array `nums` consisting of positive integers, return the number of complete subarrays.
  A subarray of an array complete if the number of distinct elements in the subarray is equal to the number of distinct elements in the whole array.

  Link: https://leetcode.com/problems/count-complete-subarrays-in-an-array
  """
  @spec count_complete_subarrays(nums :: [integer]) :: integer
  def count_complete_subarrays(nums) do
    t_nums = List.to_tuple(nums)
    t_size = tuple_size(t_nums)
    k = nums |> MapSet.new() |> MapSet.size()

    {answer, _, _, _} =
      Enum.reduce(0..(t_size - 1), {0, 0, %{}, 0},
        fn right, {ans, left, freq, distinct} ->
          value = elem(t_nums, right)

          old_count = Map.get(freq, value, 0)
          freq = Map.put(freq, value, old_count + 1)

          distinct = if old_count == 0, do: distinct + 1, else: distinct

          shrink(t_nums, t_size, right, left, freq, distinct, k, ans)
        end
      )
    answer
  end

  defp shrink(t_nums, t_size, right, left, freq, distinct, k, ans) when distinct == k do
    ans = ans + t_size - right
    left_val = elem(t_nums, left)

    old_count = Map.get(freq, left_val)
    freq = Map.put(freq, left_val, old_count - 1)

    distinct = if old_count == 1, do: distinct - 1, else: distinct
    shrink(t_nums, t_size, right, left + 1, freq, distinct, k, ans)
  end

  defp shrink(_, _, _, left, freq, distinct, _, ans), do: {ans, left, freq, distinct}





  ## redundant: 1 <= length(nums) <= 1000
  # def count_complete_subarrays2([]), do: 0

  def count_complete_subarrays2(nums) do
    t_nums = List.to_tuple(nums)
    t_size = tuple_size(t_nums)
    k = MapSet.new(nums) |> MapSet.size()

    {answer, _, _, _} =
      0..(t_size - 1)
      |> Enum.reduce({0, 0, %{}, 0}, fn right, {ans, left, seen, distinct} ->
        value = elem(t_nums, right)

        distinct = if Map.get(seen, value, -1) < left, do: distinct + 1, else: distinct
        seen = Map.put(seen, value, right)

        shrink(t_size, t_nums, right, ans, left, seen, distinct, k)
      end)

    answer
  end

  defp shrink2(t_size, t_nums, right, ans, left, seen, distinct, k) when distinct == k do
    ans = ans + t_size - right
    left_val = elem(t_nums, left)

    distinct = if Map.get(seen, left_val) > left, do: distinct, else: distinct - 1

    shrink2(t_size, t_nums, right, ans, left + 1, seen, distinct, k)
  end

  defp shrink2(_, _, _, ans, left, seen, distinct, _),
    do: {ans, left, seen, distinct}
end
