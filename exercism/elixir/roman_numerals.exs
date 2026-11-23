defmodule RomanNumerals do
  @moduledoc """
  Provides a function to convert a number from Arabic numerals to a Roman numeral string.

  Link: https://exercism.org/tracks/elixir/exercises/roman-numerals
  """
  @dec_to_roman %{
    1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C",
    90 => "XC", 50 => "L", 40 => "XL", 10 => "X",
    9 => "IX", 5 => "V", 4 => "IV", 1 => "I",
  }

  @spec numeral(n :: pos_integer()) :: String.t()
  def numeral(n), do: build_numeral(n, 1000, "")
  
  defp build_numeral(0, _, result), do: result
  
  defp build_numeral(n, factor, result) when div(n, factor) == 0,
    do: build_numeral(n, div(factor, 10), result)

  defp build_numeral(n, factor, result) do
    digit = div(n, factor)
    roman_numeral =
      Map.get(@dec_to_roman, digit * factor,
        "#{digit > 5 and Map.get(@dec_to_roman, factor * 5) || ""}#{String.duplicate(Map.get(@dec_to_roman, factor), rem(digit, 5))}"
      )
    build_numeral(rem(n, factor), div(factor, 10), <<result::binary, roman_numeral::binary>>)
  end



  @spec numeral2(n :: pos_integer()) :: String.t()
  def numeral2(0), do: ""
  
  def numeral2(n) when n >= 1000, do: "M" <> numeral(n - 1000)
  def numeral2(n) when n >= 900, do: "CM" <> numeral(n - 900)
  def numeral2(n) when n >= 500, do: "D" <> numeral(n - 500)
  def numeral2(n) when n >= 400, do: "CD" <> numeral(n - 400)
  def numeral2(n) when n >= 100, do: "C" <> numeral(n - 100)
  def numeral2(n) when n >= 90, do: "XC" <> numeral(n - 90)
  def numeral2(n) when n >= 50, do: "L" <> numeral(n - 50)
  def numeral2(n) when n >= 40, do: "XL" <> numeral(n - 40)
  def numeral2(n) when n >= 10, do: "X" <> numeral(n - 10)
  def numeral2(n) when n >= 9, do: "IX" <> numeral(n - 9)
  def numeral2(n) when n >= 5, do: "V" <> numeral(n - 5)
  def numeral2(n) when n >= 4, do: "IV" <> numeral(n - 4)
  def numeral2(n) when n >= 1, do: "I" <> numeral(n - 1)
end
