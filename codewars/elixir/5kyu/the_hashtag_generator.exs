defmodule Hashtag do
  @moduledoc """
  [5 kyu] The Hashtag Generator

  Prefix the given string with a hashtag, and capitalize each word, removing every whitespace delimiter.
  If the final result is longer than 140 chars it must return false.
  If the input or the result is an empty string it must return false.

  Examples:
    " Hello there thanks for trying my Kata"
    => "#HelloThereThanksForTryingMyKata"

    "    Hello     World   "
    => "#HelloWorld"

    "    "
    => false

  Link: https://www.codewars.com/kata/52449b062fb80683ec000024/train/elixir
  """
  @spec generate(input :: String.t()) :: String.t() | boolean()
  def generate(input) do
    input
    |> String.split(" ", trim: true)
    |> Enum.map(&String.capitalize/1)
    |> Enum.join()
    |> case do
      "" -> false
      s -> byte_size(s) < 140 && "##{s}" # not <=, save space for "#"
    end
  end
end
