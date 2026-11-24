defmodule Challenge do
  @moduledoc """
  [6kyu] Multiple of 3 or 5

  Find the sum all the natural numbers below n that are multiples of 3 or 5.
  If the number is negative, return 0.
  If a number is a multiple of both 3 and 5, only count it once.

  Link: https://www.codewars.com/kata/514b92a657cdc65150000006/train/elixir
  """
  @spec solution(n :: integer()) :: non_neg_integer()
  def solution(n) when n <= 0, do: 0
  def solution(n) do
    sum_of_multiples(3, n) + sum_of_multiples(5, n) - sum_of_multiples(15, n)
  end
  
  defp sum_of_multiples(n, limit), do: Enum.sum(n..(limit - 1)//n)


  @spec solution2(n :: integer()) :: non_neg_integer()
  def solution2(n) when n <= 3, do: 0
  def solution2(n) do
    sum_of_multiples2(3, n - 1) + sum_of_multiples2(5, n - 1) - sum_of_multiples2(15, n - 1)
  end
  
  defp sum_of_multiples2(m, limit) do
    n = div(limit, m) # natural numbers N
    div(n * (n + 1) * m, 2)
  end
end
