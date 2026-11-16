defmodule Solution do
  @moduledoc """
  [7] Reverse Integer

  Given a signed 32-bit integer x, return x with its digits reversed.
  If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

  Examples:
    -321
    => -123

    1534236469
    => 0 (only at end when 964632435 -> 9646324351 does reversed > @max_int32)

  Link: https://leetcode.com/problems/reverse-integer/
  """
  @max_int32 2_147_483_647
  @min_int32 -2_147_483_648

  @spec reverse(x :: integer) :: integer
  def reverse(x) when x in -9..9, do: x
  def reverse(x), do: do_reverse(x, 0)

  defp do_reverse(_, rev) when rev <= @min_int32 or rev >= @max_int32, do: 0
  defp do_reverse(0, rev), do: rev
  defp do_reverse(x, rev), do: do_reverse(div(x, 10), rev * 10 + rem(x, 10))
end
