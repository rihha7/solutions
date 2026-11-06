defmodule Bus do
  @moduledoc """
  [7kyu] Number of People in the Bus

  You're given a list of integer pairs. Elements of each pair represent the number of people that get on the bus (the first item) and the number of people that get off the bus (the second item) at a bus stop.
  Return the number of people who are still on the bus after the last bus stop.

  Link: https://www.codewars.com/kata/5648b12ce68d9daa6b000099/train/elixir
  """
  @spec number([{integer(), integer()}]) :: integer()
  def number(stops) do
    Enum.reduce(stops, 0, fn {on, off}, total -> total + on - off end) # or: &(&2 + elem(&1, 0) - elem(&1, 1))
  end

  def number2([]), do: 0
  def number2([{on, off}|tail]), do: number2(tail) + on - off
end

