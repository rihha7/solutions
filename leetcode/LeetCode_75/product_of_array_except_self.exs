defmodule Solution do
  @moduledoc """
  [238] Product of Array Except Self (7)

  You must write an algorithm that runs in O(n) time.
  You CANNOT use the division operation.

  Examples:
    product_except_self([1,2,3,4])
    => [24,12,8,6]

    product_except_self([-1,1,0,-3,3])
    => [0,0,9,0,0]

  Link: https://leetcode.com/problems/product-of-array-except-self
  """
  @spec product_except_self(nums :: [integer]) :: [integer]
  def product_except_self([n1, n2]), do: [n2, n1]
  
  def product_except_self(nums) do
    answer = do_left(nums, 1, [])
    do_right(Enum.reverse(nums), answer, 1, [])
  end

  defp do_left([], _, acc), do: acc
  defp do_left([head|tail], left, acc),
    do: do_left(tail, left * head, [left|acc])

  defp do_right([], [], _, acc), do: acc
  defp do_right([h1|t1], [h2|t2], right, acc),
    do: do_right(t1, t2, right * h1, [h2*right|acc])
end
