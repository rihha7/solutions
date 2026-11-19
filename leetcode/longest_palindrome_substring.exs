defmodule Solution do
  @moduledoc """
  [5] Longest Palindromic Substring

  Return the longest palindromic substring in `s`.

  Examples:
    longest_palindrome("babad")
    => "bab" ("aba" is also valid)

    longest_palindrome("cbbd")
    => "bb"

  Testcases:
    "bacabab"
    "aaaa"
    "abacab"
    "ba"
    "ccd"
    "aaa"
    "abs"
    "a"
    "aaaaaa"
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    "xabbax"
    "abbcccba"
    "abacab"
    "aabaftgyhujaaba"
    "bswrhxboawtdfqggqfdtwyypwnssnwpyyaobxhrwsb"

  Link: https://leetcode.com/problems/longest-palindromic-substring/description/
  """
  @spec longest_palindrome(s :: String.t) :: String.t
  def longest_palindrome(<<_::utf8>> = s), do: s
  def longest_palindrome(<<c::utf8, c::utf8>> = s), do: s

  def longest_palindrome(<<c::utf8, _::binary>> = s) do
    if s == String.reverse(s) do
      s
    else
      t = String.codepoints(s) |> List.to_tuple()
      last_idx = tuple_size(t) - 1

      Enum.reduce(0..last_idx, {<<c::utf8>>, 1}, fn idx, {best, b_len} ->
        prev = if idx > 0, do: elem(t, idx - 1), else: nil
        current = elem(t, idx)
        next = if idx < last_idx, do: elem(t, idx + 1), else: nil

        {even, e_len} = if next && current == next,
                        do: check(t, idx - 1, idx + 2, last_idx, 2, "#{current}#{next}"),
                        else: {"", 0}
    
        {odd, o_len} = if prev && next && prev == next,
                       do: check(t, idx - 2, idx + 2, last_idx, 3, "#{prev}#{current}#{next}"),
                       else: {"", 0}

        cond do
          e_len > o_len and e_len > b_len -> {even, e_len}
          o_len > e_len and o_len > b_len -> {odd, o_len}
          true -> {best, b_len}
        end
      end)
      |> elem(0)
    end
  end

  defp check(_, left, right, last_idx, len, p) when left <= -1 or right >= last_idx + 1, do: {p, len}
  defp check(t, left, right, last_idx, len, p) do
    case {elem(t, left), elem(t, right)} do
      {c, c} -> check(t, left - 1, right + 1, last_idx, len + 2, "#{c}#{p}#{c}")
      _ -> {p, len}
    end
  end
end

