defmodule BirdCount do
  @moduledoc """
  Implement a few functions to help you keep track of how many birds have visited your garden on any given day.

  Link: https://exercism.org/tracks/elixir/exercises/bird-count
  """
  @spec today(list :: [non_neg_integer()]) :: non_neg_integer() | nil
  def today([]), do: nil
  def today([head|_]), do: head

  @spec increment_day_count(list :: [non_neg_integer()]) :: [non_neg_integer()]
  def increment_day_count([]), do: [1]
  def increment_day_count([head|tail]), do: [head + 1|tail]

  @spec has_day_without_birds?(list :: [non_neg_integer()]) :: boolean()
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0|_]), do: true
  def has_day_without_birds?([_|tail]), do: has_day_without_birds?(tail)
  # def has_day_without_birds2(list), do: Enum.any?(list, &(&1 == 0))

  @spec total(list :: [non_neg_integer()]) :: non_neg_integer()
  def total(list), do: do_total(list, 0)
  defp do_total([], total), do: total
  defp do_total([0|tail], total), do: do_total(tail, total)
  defp do_total([head|tail], total), do: do_total(tail, total + head)
  # def total2(list), do: Enum.sum(list)

  @spec busy_days(list :: [non_neg_integer()]) :: non_neg_integer()
  def busy_days(list), do: count_busy_days(list, 0)
  defp count_busy_days([], count), do: count
  defp count_busy_days([head|tail], count) when head >= 5,
    do: count_busy_days(tail, count + 1)
  defp count_busy_days([_|tail], count),
    do: count_busy_days(tail, count)
  # def busy_days2(list), do: Enum.count(list, &(&1 >= 5))
end
