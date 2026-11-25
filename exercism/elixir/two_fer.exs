defmodule TwoFer do
  @moduledoc """
  Determine what you will say as you give away an extra cookie.
  
  If you know the person's name (e.g. Do-yun), return "One for Do-yun and one for me."
  If you don't know the person's name, return "One for you and one for me."

  ONLY accept an empty input or a string input.

  Link: https://exercism.org/tracks/elixir/exercises/two-fer
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_binary(name), do: "One for #{name}, one for me."
end

