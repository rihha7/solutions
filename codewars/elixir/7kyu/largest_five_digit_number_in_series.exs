defmodule LargestInSeries do
  @moduledoc """
  [7kyu] Largest 5 digit number in a series

  Complete the solution so that it returns the greatest sequence of five consecutive digits found within the number given. The number will be passed in as a string of only digits. It should return a five digit integer.

  Example:
    1234567890
    => 67890

  Link: https://www.codewars.com/kata/51675d17e0c1bed195000001/train/elixir
  """
  @spec solution(String.t) :: integer
  def solution(number) do
    chars = String.to_charlist(number) |> Enum.map(&(&1 - ?0))

    Enum.reduce(0..(String.length(number) - 5), 0, fn start, best ->
      Enum.slice(chars, start, 5)
      |> Enum.join()
      |> String.to_integer()
      |> max(best)
    end)
  end


  def solution2(number) do
    chars = String.to_charlist(number) |> Enum.map(&(&1 - ?0))

    chars
    |> Enum.chunk_every(5, 1, :discard)
    |> Enum.map(&Enum.reduce(&1, 0, fn digit, acc -> acc * 10 + digit end))
    |> Enum.max(fn -> 0 end)
  end
end
