defmodule Solution do
  @moduledoc """
  [13] Roman To Integer

  Roman numerals are represented by seven different symbols:
    I (1), V (5), X (10), L (50), C (100), D (500), M (1000)
  Given a roman numeral, convert it to an integer.

  Example:
    roman_to_int("MCMXCIV")
    => 1994 (M = 1000, CM = 900, XC = 90 and IV = 4)

  Constraints:
    1 <= s.length <= 15
    1 <= s <= 3999

  Link: https://leetcode.com/problems/roman-to-integer
  """
  @roman_to_dec %{
    "M" => 1000, "CM" => 900, "D" => 500, "CD" => 400, "C" => 100,
    "XC" => 90, "L" => 50, "XL" => 40, "X" => 10,
    "IX" => 9, "V" => 5, "IV" => 4, "I" => 1,
  }

  @spec roman_to_int(s :: String.t) :: integer
  @spec roman_to_int(s :: String.t, i :: integer) :: integer
  def roman_to_int(s, n \\ 0)

  def roman_to_int("", n), do: n

  def roman_to_int(<<r::utf8>>, n),
    do: n + Map.get(@roman_to_dec, <<r::utf8>>)

  def roman_to_int(<<r1::utf8, r2::utf8, rest::binary>>, n) do
    if is_map_key(@roman_to_dec, <<r1::utf8, r2::utf8>>) do
      roman_to_int(rest,
                   n + Map.get(@roman_to_dec, <<r1::utf8, r2::utf8>>))
    else
      roman_to_int(<<r2::utf8, rest::binary>>,
                   n + Map.get(@roman_to_dec, <<r1::utf8>>))
    end
  end
end
