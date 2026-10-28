defmodule Solution do
  @moduledoc """
  [3] Longest Substring Without Repeating Characters
  Given a string s, find the length of the longest substring without duplicate characters.

  Example:
    length_of_longest_substring("abcabcbb")
    => 3 ("abc" / "bca" / "cab" are of length 3)

  Constraints:
    0 <= s.length <= 105
    s consists of English letters, digits, symbols and spaces.

  Link: https://leetcode.com/problems/longest-substring-without-repeating-characters 
  """
  @spec length_of_longest_substring1(s :: String.t) :: integer
  def length_of_longest_substring1(s) do
    len = String.length(s)
    chars = String.to_charlist(s)

    Enum.reduce(0..(len - 1), 0, fn cv, best ->
      Enum.reduce_while(cv..(len - 1), {0, MapSet.new()}, fn idx, {count, seen} ->
        ch = Enum.at(chars, idx)
        case MapSet.member?(seen, ch) do
          true -> {:halt, {count, seen}}
          false -> {:cont, {count + 1, MapSet.put(seen, ch)}}
        end
      end)
      |> case do
        {count, _seen} when count > best -> count
        _ -> best
      end
    end)
  end



  def length_of_longest_substring2(s) do
    len = String.length(s)
    chars = String.to_charlist(s)

    Enum.reduce(0..(len - 1), 0, fn idx, best ->
      chars
      |> Enum.drop(idx)
      |> Enum.reduce_while({0, MapSet.new()}, fn c, {count, seen} ->
        case MapSet.member?(seen, c) do
          true -> {:halt, {count, seen}}
          false -> {:cont, {count + 1, MapSet.put(seen, c)}}
        end
      end)
      |> elem(0)
      |> max(best) # max(elem(0), best)
    end)
  end



  def length_of_longest_substring3(s) do
    String.to_charlist(s)
    |> Enum.with_index()
    |> Enum.reduce({0, %{}, 0}, fn {c, right}, {left, seen, best} ->
      left =
        case Map.get(seen, c) do
          prev when is_integer(prev) and prev >= left -> prev + 1 
          _ -> left
        end

      seen = Map.put(seen, c, right)
      best = max(best, right - left + 1)
      {left, seen, best}
    end)
    |> elem(2)
  end
end

