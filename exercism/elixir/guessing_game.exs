defmodule GuessingGame do
  @moduledoc """
  Provides a function that returns different responses depending on how the guess relates to the secret number.

  Link: https://exercism.org/tracks/elixir/exercises/guessing-game
  """
  @spec compare(secret_number :: integer()) :: String.t()
  @spec compare(secret_number :: integer(), guess :: atom() | integer()) :: String.t()
  def compare(_secret_number, guess \\ :no_guess)
  def compare(_secret_number, :no_guess), do: "Make a guess"
  
  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  
  def compare(_secret_number, _guess), do: "Correct"
end

