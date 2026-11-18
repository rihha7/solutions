defmodule Kata do
  @moduledoc """
  [4kyu] So Many Permutations!

  Create all permutations of a non-empty input string and remove duplicates.
  i.e., create as many unique "shufflings" as possible!

  Examples:
    permutations("a")
    => ~w(a)

    permutations("ab")
    => ~w(ab ba)

    permutations("aabb")
    => ~w(aabb abab abba baab baba bbaa)

  Note: No need to sort, test performs Enum.sort.

  Link: https://www.codewars.com/kata/5254ca2719453dcc0b00027d/train/elixir
  """
  @spec permutations(String.t()) :: [String.t()]
  def permutations(s) do
    String.codepoints(s)
    |> do_permute()
    |> Enum.map(&Enum.join/1)
    |> Enum.uniq
  end

  defp do_permute([]), do: [[]]
  defp do_permute(list) do
    for elem <- list, rest <- do_permute(list -- [elem]), do: [elem | rest]
  end


  # The -- operator is O(n). It also allocates a new list every recursive call.
  # Solution: Use a map instead.
  # It naturally eliminates duplicates as identical characters share one counter.

  @spec permutations2(String.t()) :: [String.t()]
  def permutations2(s) do
    String.codepoints(s)
    |> Enum.frequencies()
    |> permute2([])
    # |> permute3(&Enum.join/1)
  end
  
  defp permute2(counts, acc) when map_size(counts) == 0, do: [Enum.join(acc)]
  
  defp permute2(counts, acc) do
    Enum.flat_map(counts, fn {char, count} ->
      new_counts =
        if count == 1 do
          Map.delete(counts, char)
        else
          Map.put(counts, char, count - 1)
        end
        
      permute2(new_counts, [char | acc])
    end)
  end


  # using a continuation rather than an accumulator...
  defp permute3(counts, build) when map_size(counts) == 0, do: [build.([])]
  
  defp permute3(counts, build) do
    Enum.flat_map(counts, fn {char, count} ->
      new_counts =
        if count == 1, do: Map.delete(counts, char),
                       else: Map.put(counts, char, count - 1)
                       
        permute3(new_counts, fn path -> build.([char|path]) end)
    end)
  end
end

