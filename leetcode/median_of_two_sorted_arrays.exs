defmodule Solution do
  @moduledoc """
  [4] Median Of Two Sorted Arrays

  m = size(nums1), n = size(nums2)
  Return the median of the two sorted arrays. The overall run time complexity should be O(log(m+n)).

  Examples:
    nums1 = [1,3], nums2 = [2]
    => 2.00000  (merged array = [1,2,3] and median is 2)
    nums1 = [1,2], nums2 = [3,4]
    => 2.50000  (merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5)

  Constraints:
    0 <= m <= 1000
    0 <= n <= 1000
    1 <= m + n <= 2000

  Link: https://leetcode.com/problems/median-of-two-sorted-arrays
  """
  @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
  def find_median_sorted_arrays(nums1, nums2) do
    {t_nums1, t_nums2} = {List.to_tuple(nums1), List.to_tuple(nums2)}
    {m, n} = {tuple_size(t_nums1), tuple_size(t_nums2)}

    a = kth(t_nums1, t_nums2, 0, 0, div(m + n + 1, 2))
    b = kth(t_nums1, t_nums2, 0, 0, div(m + n + 2, 2))

    (a + b) / 2
  end

  # Base cases: one side is exhausted
  defp kth(a, b, i, j, k) when i >= tuple_size(a), do: elem(b, j + k - 1)
  defp kth(a, b, i, j, k) when j >= tuple_size(b), do: elem(a, i + k - 1)

  # Base case: k == 1
  defp kth(a, b, i, j, 1), do: min(elem(a, i), elem(b, j))

  defp kth(a, b, i, j, k) do
    p = div(k, 2)
    x = if i + p - 1 < tuple_size(a), do: elem(a, i + p - 1), else: Float.INFINITY
    y = if j + p - 1 < tuple_size(b), do: elem(b, j + p - 1), else: Float.INFINITY

    if x < y do
      kth(a, b, i + p, j, k - p)
    else
      kth(a, b, i, j + p, k - p)
    end
  end
end
