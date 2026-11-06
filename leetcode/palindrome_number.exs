defmodule Solution do
  @moduledoc """
  [9] Palindrome Number

  Given an integer x, return true if x is a palindrome, and false otherwise.
  Could you solve it without converting the integer to a string?

  Example:
    is_palindrome(121)
    => true (reads same from left to right (121) and right to left (121))

  Constraints:
    -231 <= x <= 231 - 1

  Link: https://leetcode.com/problems/palindrome-number
  """
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x), do: check_palindrome(x)

  defp check_palindrome(x) when x < 0, do: false
  defp check_palindrome(x) when x < 10, do: true
  defp check_palindrome(x) when x != 0 and rem(x, 10) == 0, do: false  # handles cases such as 10, 21120

  defp check_palindrome(x, reversed \\ 0)
  defp check_palindrome(x, reversed) do
    {x, reversed} = {div(x, 10), reversed + rem(x, 10)}

    cond do
      x == reversed || div(x, 10) == reversed -> true
      reversed > x -> false
      true -> check_palindrome(x, reversed * 10)
    end
  end
end
