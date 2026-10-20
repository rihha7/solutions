defmodule Rules do
  @moduledoc """
  Implements rules from the classic game Pac-Man.

  Link: https://exercism.org/tracks/elixir/exercises/pacman-rules
  """

  @spec eat_ghost?(power_pellet_active? :: boolean(), touching_ghost? :: boolean()) :: boolean()
  def eat_ghost?(power_pellet_active?, touching_ghost?),
    do: power_pellet_active? and touching_ghost?

  @spec score?(touching_power_pellet? :: boolean(), touching_dot? :: boolean()) :: boolean()
  def score?(touching_power_pellet?, touching_dot?),
    do: touching_power_pellet? or touching_dot?

  @spec lose?(power_pellet_active? :: boolean(), touching_ghost? :: boolean()) :: boolean()
  def lose?(power_pellet_active?, touching_ghost?),
    do: not power_pellet_active? and touching_ghost? 

  @spec win?(has_eaten_all_dots? :: boolean(), power_pellet_active? :: boolean(), touching_ghost? :: boolean()) :: boolean()
  def win?(has_eaten_all_dots?, power_pellet_active?, touching_ghost?),
    do: not lose?(power_pellet_active?, touching_ghost?) and has_eaten_all_dots?
end
