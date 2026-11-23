defmodule Solution do
  @moduledoc """
  [1768] Merge Strings Alternately (1/75)

  Merge the given strings `word1` and `word2` by adding letters in alternating order, starting with word1.
  Append the additional letters onto the end of the merged string.

  Examples:
    merge_alternately("abc", "pqr")
    => "apbqcr"

  Link: https://leetcode.com/problems/merge-strings-alternately
  """

  @spec merge_alternately(word1 :: String.t(), word2 :: String.t()) :: String.t()
  def merge_alternately(word1, word2), do: do_merge(word1, word2, "")

  defp do_merge("", "", acc), do: acc

  defp do_merge("", word, acc), do: <<acc::binary, word::binary>>
  defp do_merge(word, "", acc), do: <<acc::binary, word::binary>>

  defp do_merge(<<c1::utf8, rest1::binary>>, <<c2::utf8, rest2::binary>>, acc),
    do: do_merge(rest1, rest2, <<acc::binary, c1::utf8, c2::utf8>>)
end






testcases = [
  {"", "", ""}, {"z", "q", "zq"}, {"abc", "", "abc"}, {"", "abc", "abc"}, {"abc", "pqr", "apbqcr"},
  {"ab", "pqrs", "apbqrs"}, {"abcd", "pq", "apbqcd"}, {"a", "uvwxyz", "auvwxyz"}
]

for {word1, word2, expected} <- testcases do
  got = Solution.merge_alternately(word1, word2)
  reaction = got == expected and "✅" || "❌"

  IO.puts("Solution.merge_alternately(\"#{word1}\", \"#{word2}\") => got: \"#{got}\", expected: \"#{expected}\" #{reaction}")
end
