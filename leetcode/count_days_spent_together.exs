defmodule Solution do
  @moduledoc """
  [2409] Count Days Spent Together

  Alice and Bob are traveling to Rome for separate business meetings.
  Alice will be in the city from the given dates `arriveAlice` to `leaveAlice` (inclusive).
  Bob will also be in the city from the given dates `arriveBob` to `leaveBob` (inclusive).

  All dates are provided in the format "MM-DD".
  The given dates are valid dates of a non-leap year.

  Link: https://leetcode.com/problems/count-days-spent-together/
  """
  @days_in_month [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  @spec count_days_together(arrive_alice :: String.t, leave_alice :: String.t, arrive_bob :: String.t, leave_bob :: String.t) :: integer
  def count_days_together(arrive_alice, leave_alice, arrive_bob, leave_bob) do
    {a_start, a_end} = {to_day(arrive_alice), to_day(leave_alice)}
    {b_start, b_end} = {to_day(arrive_bob), to_day(leave_bob)}

    max(0, min(a_end, b_end) - max(a_start, b_start) + 1)
  end


  # old `to_day1()`
  defp to_day1(s) do
    [month, day] = String.split(s, "-") |> Enum.map(&String.to_integer/1)
    get_days(0, month - 1, day, 0)
  end

  # improved `to_day2()`
  defp to_day2(<<month::binary-size(2), _>> <> day) do
    get_days(0, String.to_integer(month) - 1, String.to_integer(day), 0)
  end

  # alternative `to_day3()`
  defp to_day3(<<month::binary-size(2), _, day::binary-size(2)>>) do # _ = "-"
    Date.new!(2023, String.to_integer(month), String.to_integer(day)) |> Date.day_of_year()
  end


  # tail recursion
  defp get_days1(i, mm, dd, total) when i < mm,
    do: get_days1(i + 1, mm, dd, total + Enum.at(@days_in_month, i))
  defp get_days1(i, mm, dd, total) when i == mm, do: total + dd

  # recursion
  defp get_days2(i, mm, dd) when i < mm,
    do: Enum.at(@days_in_month, i) + get_days2(i + 1, mm, dd)
  defp get_days2(i, mm, dd) when i == mm, do: dd

  # optimised
  defp get_days3(_, i, mm, dd) when i == mm, do: dd
  defp get_days3([first|rest], i, mm, dd), do: first + get_days(rest, i + 1, mm, dd)
end
