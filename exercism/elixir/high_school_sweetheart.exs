defmodule HighSchoolSweetheart do
  @moduledoc """
  Generates an ASCII box featuring the initials of two high school sweethearts.

  Link: https://exercism.org/tracks/elixir/exercises/high-school-sweetheart
  """

  @spec first_letter(name :: String.t()) :: String.t()
  def first_letter(name),
    do: String.trim_leading(name) |> String.first()

  @spec initial(name :: String.t()) :: String.t()
  def initial(name),
    do: "#{first_letter(name) |> String.upcase(:ascii)}."

  @spec initials(full_name :: String.t()) :: String.t()
  def initials(full_name) do
    String.split(full_name, " ", trim: true)
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  @spec pair(full_name1 :: String.t(), full_name2 :: String.t()) :: String.t()
  def pair(full_name1, full_name2) do
    initials1 = 
    initials2 = initials(full_name2)
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end

