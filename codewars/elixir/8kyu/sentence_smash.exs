defmodule Kata do
  @moduledoc """
  [8kyu] Sentence Smash

  Write a function that takes an array of words and smashes them together into a sentence and returns the sentence.

  Example:
    ["hello", "world", "this", "is", "great"]
      => "hello world this is great"

  Link: https://www.codewars.com/kata/53dc23c68a0c93699800041d/train/elixir
  """
  @spec smash([String.t()]) :: String.t()
  @spec smash([String.t()], String.t()) :: String.t()
  def smash(_, acc \\ "") # uses tail recursion rather than: def smash([h|t]), do: h <> " " <> smash(t)
  def smash([], acc), do: acc
  def smash([head], acc), do: <<acc::binary, head::binary>>
  def smash([head|tail], acc), do: smash(tail, <<acc::binary, head::binary, " ">>)


  def smash2(words), do: Enum.join("")

  def smash3(words), do: Enum.intersperse(words, ?\s) |> IO.iodata_to_binary()
end
