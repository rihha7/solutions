defmodule ResistorColor do
  @moduledoc """
  Given a resistors color band, return the numerical resistance value.
  For this exercise (using Elixir), returning the list of colors is not required.

  Link: https://exercism.org/tracks/elixir/exercises/resistor-color
  """
  @color_map %{
    black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9
  }

  @spec code(atom()) :: integer()
  def code(:black), do: 0
  def code(:brown), do: 1
  def code(:red), do: 2
  def code(:orange), do: 3
  def code(:yellow), do: 4
  def code(:green), do: 5
  def code(:blue), do: 6
  def code(:violet), do: 7
  def code(:grey), do: 8
  def code(:white), do: 9


  @spec code2(color :: atom()) :: integer()
  def code2(color), do: Map.get(@color_map, color, -1)
end
