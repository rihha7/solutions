defmodule Solution do
  @moduledoc """
  [1071] Greatest Common Divisor of Strings (2/75)

  For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).
  Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

  Examples:
    gcd_of_strings("ABCABC", "ABC")
    => "ABC" (substring "ABC" is divides both str1 (twice) and str2 (once))

    gcd_of_strings("AAAAAB", "AAA")
    => "" (substring "AAA" is not the only substring in str1)

  Link: https://leetcode.com/problems/greatest-common-divisor-of-strings
  """
  @spec gcd_of_strings(str1 :: String.t, str2 :: String.t) :: String.t
  def gcd_of_strings(str1, str2) do
    cond do
      <<str1::binary, str2::binary>> != <<str2::binary, str1::binary>> -> ""
      true -> String.slice(str2, 0, gcd(byte_size(str1), byte_size(str2))) # str1 and str2 consist of English uppercase letters.
    end
  end

  defp gcd(a, 0), do: a
  defp gcd(a, b), do: gcd(b, rem(a, b))
end




testcases = [
  {"ABCABC", "ABC", "ABC"}, {"ABABAB", "ABAB", "AB"}, {"LEET", "CODE", ""},
  {"AAAAAB", "AAA", ""}, {"ABCDEF", "ABC", ""}, {"AA", "A", "A"}, {"ABABABAB", "ABAB", "ABAB"},
  {"NLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGM", "NLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGMNLZGM", "NLZGM"},
]

for {s1, s2, expected} <- testcases do
  got = Solution.gcd_of_strings(s1, s2)
  reaction = got == expected and "✅" || "❌"

  IO.puts("Solution.gcd_of_strings(\"#{s1}\", \"#{s2}\") => got: \"#{got}\", expected: \"#{expected}\" #{reaction}")
end
