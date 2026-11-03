defmodule Solution do
  @moduledoc """
  [14] Longest common prefix

  Find the longest common PREFIX string amongst an array of strings.
  If there is no common PREFIX, return an empty string "".

  Example:
    strs = ["flower","flow","flight"]
    => "fl"

  Constraints:
    1 <= strs.length <= 200
    0 <= strs[i].length <= 200

  Test Cases:
    ["flower","flower","flower","flower"]
    ["",""]
    ["rowdynas","rowpynas","rowllbynas"]
    ["a"]
    ["a", "aca", "accb", "b"]
    ["iflower","flow","flight"]
    ["c","acc","ccc"]
    ["reflower","flow","flight"] 

  Link: https://leetcode.com/problems/longest-common-prefix
  """
  @spec longest_common_prefix(strs :: [String.t]) :: String.t
  def longest_common_prefix([head|tail] = strs) do
    min_len = Enum.map(strs, &String.length/1) |> Enum.min()

    right =
      Enum.reduce_while(0..max(0, min_len - 1), 0, fn idx, right ->
        letter = String.at(head, idx)
        if letter && Enum.all?(tail, &(String.at(&1, idx) == letter)) do
          {:cont, right + 1}
        else
          {:halt, right}
        end
      end)

    String.slice(head, 0, right)
  end


  # method 2 (compares the two most divergent strings)...
  def longest_common_prefix2(strs) do
    # n: length of `strs`
    # m: max length of `strs[i]`

    [first | rest] = Enum.sort(strs)
    # time complexity: m * O(n log n) "linearithmic" (uses merge sort algorithm)
    # space: O(n) new list

    last = List.last([first | rest]) # avoids nil (List.last(tail) when tail == [] -> nil)
    # time complexity: O(n) "linear" (every element in a linked list is traversed)
    # space: O(1) (single primitive value stored)

    common_prefix(first, last, "")
    # time complexity: worst case = O(m), best case = O(1) (tail recursion iterating)
    # space: O(m) (string accumulator built)
  end

  defp common_prefix("", _, acc), do: acc
  defp common_prefix(_, "", acc), do: acc
  defp common_prefix(<<c::utf8, ra::binary>>, <<c::utf8, rb::binary>>, acc),
    do: common_prefix(ra, rb, <<acc::binary, c::utf8>>)
  defp common_prefix(_, _, acc), do: acc

  # time complexity: O(n log n * m) + O(n) + O(m) = O(n log n * m)
  # extra space: O(n) + O(1) + O(m) = O(n) (if n ≥ m), or more precisely O(n + m)
end
