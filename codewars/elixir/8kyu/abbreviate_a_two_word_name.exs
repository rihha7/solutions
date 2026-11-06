defmodule Kata do
  @moduledoc """
  [8kyu] Abbreviate a Two Word Name

  Write a function to convert a name into initials.
  This kata strictly takes two words with one space in between them.

  Examples:
    Sam Harris      => S.H
    patrick feeney  => P.F

  Link: https://www.codewars.com/kata/57eadb7ecd143f4c9c0000a3/train/elixir
  """
  @spec abbrev_name(name :: String.t()) :: String.t()
  def abbrev_name(name) do
    {idx, _} = :binary.match(name, " ")
    <<first_name::binary-size(idx), _, last_name::binary>> = name
    # :binary.first/1 and <<first, _::binary>> are both O(1).
    
    initial1 = :binary.first(first_name) |> capitalise()
    initial2 = :binary.first(last_name) |> capitalise()

    <<initial1::utf8, ".", initial2::utf8>>
  end
  
  defp capitalise(c), do: if(c >= ?a, do: c - ?a + ?A, else: c)



  def abbrev_name2(name) do
    String.split(name, " ")
    |> Stream.map(&String.capitalize/1)
    |> Stream.map(&String.at(&1, 0))
    |> Enum.join(".")
  end
end
