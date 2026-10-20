defmodule FreelancerRates do
  @moduledoc """
  Calculates daily and monthly rates offered to a freelancer, given an hourly rate and optionally a discount for the most loyal customers. 

  Link: https://exercism.org/tracks/elixir/exercises/freelancer-rates
  """
  @billable_days_per_month 22
  
  @spec daily_rate(hourly_rate :: pos_integer()) :: float()
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  @spec apply_discount(before_discount :: number(), discount :: number()) :: float()
  def apply_discount(before_discount, discount),
    do: (100 - discount) / 100 * before_discount # or: (1 - (discount / 100)) * before_discount

  @spec monthly_rate(hourly_rate :: pos_integer(), discount :: number()) :: pos_integer()
  def monthly_rate(hourly_rate, discount) do
    daily = calc_daily_rate(hourly_rate, discount)
    ceil(daily * @billable_days_per_month)
  end

  @spec days_in_budget(budget :: pos_integer(), hourly_rate :: pos_integer(), discount :: number()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    daily = calc_daily_rate(hourly_rate, discount)
    floor(budget / daily * 10) / 10 # or: Float.floor(budget / daily, 1)
  end


  @spec calc_daily_rate(hourly_rate :: pos_integer(), discount :: number()) :: float()
  defp calc_daily_rate(hourly_rate, discount),
    do: daily_rate(hourly_rate) |> apply_discount(discount)
end

