defmodule FindTheDivisors do
  @moduledoc """
  [7kyu] Find The Divisors

  Create a function `divisors` that takes an integer (n > 1) and returns an array of all of the integer's divisors.
  Exclude 1 and the number itself.
  If a number has no divisors (besides 1 and itself), return the string "n is prime".
  Order from smallest to largest.

  Example:
    12
    => [2, 3, 4, 6]

    11
    => "11 is prime"

  Link: https://www.codewars.com/kata/544aed4c4a30184e960010f4/train/elixir
  """
  @spec divisors(n :: pos_integer()) :: [pos_integer()] | String.t()
  def divisors(n), do: get_divisors(n, div(n, 2), [])
  
  defp get_divisors(n, 1, []), do: "#{n} is prime"
  defp get_divisors(_, 1, list), do: list
  # since we start from largest div -> div - 1, and append div ([h|t]), no need to reverse
  
  defp get_divisors(n, div, list) when rem(n, div) == 0,
    do: get_divisors(n, div - 1, [div|list])
  defp get_divisors(n, div, list),
    do: get_divisors(n, div - 1, list)
end
