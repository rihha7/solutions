defmodule RecreationOne do
  @moduledoc """
  [5kyu] Recreation One

  Find the numbers between m and n whose sum of their divisors squared is a square itself.

  Example:
    m = 1, n = 250
    => [{1, 1}, {42, 2500}, {246, 84100}]
    
    Take 246 for example...
    => divisors = [1, 246, 2, 123, 3, 82, 6, 41]

    => divisors squared = [1, 60516, 4, 15129, 9, 6724, 36, 1681]
    => sum of divisors squared = 84100 (which is a square itself (290*290))

  Link: https://www.codewars.com/kata/55aa075506463dac6600010d/train/elixir
  """
  @type int_tpl :: {pos_integer(), pos_integer()}
  @spec list_squared(pos_integer(), pos_integer()) :: [int_tpl()] 
  @spec list_squared(pos_integer(), pos_integer(), [int_tpl()]) :: [int_tpl()] 
  def list_squared(m, n, acc \\ [])

  def list_squared(m, n, acc) when m > n, do: Enum.reverse(acc)

  def list_squared(m, n, acc) do
    sum = sum_of_squared_divisors(m)
    r = round(:math.sqrt(sum))

    if r * r == sum,
      do: list_squared(m + 1, n, [{m, sum}|acc]),
      else: list_squared(m + 1, n, acc)
  end

  defp sum_of_squared_divisors(n) do
    Enum.reduce(1..round(:math.sqrt(n)), 0, fn d, acc ->
      other = div(n, d)

      case rem(n, d) do
        0 when d == other -> acc + d * d
        0 -> acc + d * d + other * other
        _ -> acc
      end
    end)
  end
end
