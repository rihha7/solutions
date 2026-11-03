defmodule LineUp do
  @moduledoc """
  Provides a function that produces a sentence using the given name and the given number as an ordinal numeral.

  Example:
    "Mary", 1
    => "Mary, you are the 1st customer we serve today. Thank you!"

  Link: https://exercism.org/tracks/elixir/exercises/line-up
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number),
    do: "#{name}, you are the #{ordinal(number)} customer we serve today. Thank you!"

  defp ordinal(n) when rem(n, 10) == 3 and rem(n, 100) != 13, do: "#{n}rd"
  defp ordinal(n) when rem(n, 10) == 2 and rem(n, 100) != 12, do: "#{n}nd"
  defp ordinal(n) when rem(n, 10) == 1 and rem(n, 100) != 11, do: "#{n}st"
  defp ordinal(n), do: "#{n}th"
end
