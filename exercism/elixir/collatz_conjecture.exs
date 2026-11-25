defmodule CollatzConjecture do
  @moduledoc """
  Provides a function that returns the number of steps it takes to reach 1 - according to the rules of the Collatz Conjecture:
  - If the number is odd, multiply by 3, then add 1
  - If the number is even, divide by 2

  Use a built in `is_even` &/ `is_odd` method.
  If input is not a positive integer (e.g., 0, -1, "fubar"), throw a FunctionClauseError exception.

  Link: https://exercism.org/tracks/elixir/exercises/collatz-conjecture
  """
  import Integer, only: [is_even: 1, is_odd: 1]

  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input), do: do_collatz(input, 0)

  defp do_collatz(1, steps), do: steps
  defp do_collatz(n, steps) when is_even(n), do: do_collatz(div(n, 2), steps + 1)
  defp do_collatz(n, steps) when is_odd(n), do: do_collatz(n * 3 + 1, steps + 1)
end
