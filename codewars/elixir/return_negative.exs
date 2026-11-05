defmodule Negator do
  @moduledoc """
  [8 kyu] Return Negative

  You are given a number. Make it negative.

  Examples:
    make_negative(1)    => -1
    make_negative(-5)   => -5
    make_negative(0)    => 0

  Link: https://www.codewars.com/kata/55685cd7ad70877c23000102/train/elixir
  """
  @speac make_negative(n :: integer()) :: neg_integer() | 0
  def make_negative(n) when n <= 0, do: n
  def make_negative(n), do: -n

  # or
  def make_negative2(n), do: -abs(n)
end
