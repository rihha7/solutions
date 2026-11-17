defmodule Solution do
  @moduledoc """
  [151] Reverse Words In a String (6)

  Given an input string s, reverse the order of the WORDS (which are space-delimited).
  `s` may contain leading or trailing spaces or multiple spaces between two words.
  The returned string should only have a single space separating the words.

  Examples:
    reverse_words("the sky is blue")
    => "blue is sky the"  (words are reversed)

    reverse_words("  hello   world  ")
    => "world hello"  (spaces are trimmed, and multiple spaces between words are reduced to 1 space)

  Link: https://leetcode.com/problems/reverse-words-in-a-string
  """
  @spec reverse_words(s :: String.t) :: String.t
  def reverse_words(s) do
    String.split(s, " ", trim: true)
    |> Enum.reverse()
    |> Enum.join(" ")
  end
end
