defmodule Lasagna do
  @moduledoc """
  Provides functions related to the time taken to prepare a lasagna.

  Link: https://exercism.org/tracks/elixir/exercises/lasagna
  """
  @minutes_per_layer 2

  @spec expected_minutes_in_oven :: pos_integer()
  def expected_minutes_in_oven(), do: 40

  @spec remaining_minutes_in_oven(actual_mins :: pos_integer()) :: integer()
  def remaining_minutes_in_oven(actual_mins),
    do: expected_minutes_in_oven() - actual_mins

  @spec preparation_time_in_minutes(no_layers :: pos_integer()) :: pos_integer()
  def preparation_time_in_minutes(no_layers),
    do: no_layers * @minutes_per_layer

  @spec total_time_in_minutes(no_layers :: pos_integer(), actual_mins :: pos_integer()) :: pos_integer()
  def total_time_in_minutes(no_layers, actual_mins),
    do: preparation_time_in_minutes(no_layers) + actual_mins

  @spec alarm :: String.t()
  def alarm(), do: "Ding!"
end
