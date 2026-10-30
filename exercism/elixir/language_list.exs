defmodule LanguageList do
  @moduledoc """
  Implements functions to manipulate a list of programming languages.

  Link: https://exercism.org/tracks/elixir/exercises/language-list
  """
  @spec new :: []
  def new, do: []

  @spec add(list :: [String.t()], language :: String.t()) :: [String.t()]
  def add(list, language), do: [language | list] # add/2 prepends

  @spec remove([String.t()]) :: [String.t()] # return list w/o first item
  def remove([_head | tail]), do: tail # assume list always has at least one item
  def remove2(list), do: tl(list)

  @spec first([String.t()]) :: String.t()
  def first([head | _tail]), do: head
  def first2(list), do: hd(list)

  @spec count(list :: [String.t()]) :: integer()
  @spec count(list :: [String.t()], c :: integer()) :: integer()
  def count(_list, c \\ 0)
  def count([_head | tail], c), do: count(tail, c + 1)
  def count([], c), do: c
  
  def count2(list), do: length(list)
  
  @spec functional_list?([String.t()]) :: boolean()
  def functional_list?(list), do: "Elixir" in list

  def functional_list2?([]), do: false
  def functional_list2?(["Elixir" | _tail]), do: true
  def functional_list2?([_head | tail]), do: functional_list2?(tail)
end

