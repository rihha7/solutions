defmodule Math do
  @moduledoc """
  [7kyu] You're a square!

  Given an integral number, determine if it's a square number (aka: perfect square).

  Examples:
    -1 => false
    0 => true
    1 => false
    4 => true

  Link: https://www.codewars.com/kata/54c27a33fb7da0db0100040e/train/elixir
  """
  @spec square?(n :: integer()) :: boolean()
  def square?(n) when n < 0, do: false
  
  def square?(n) do
    r = round(:math.sqrt(n))
    r * r == n
    # or: r == :math.sqrt(n)
  end
end
