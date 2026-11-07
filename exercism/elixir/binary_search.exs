defmodule BinarySearch do
  @moduledoc """
  Implements the binary search algorithm on a given sorted list.
  
  Link: https://exercism.org/tracks/elixir/exercises/binary-search
  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    {left, right} = {0, tuple_size(numbers) - 1}
    binary_search1(numbers, key, left, right, div(left + right, 2))
    # binary_search2(numbers, key, left, right, div(left + right, 2))
  end

  defp binary_search1(_, _, left, right, _) when left > right, do: :not_found

  defp binary_search1(numbers, key, left, right, mid)
    when key == elem(numbers, mid),
    do: {:ok, mid}

  defp binary_search1(numbers, key, left, right, mid)
    when key > elem(numbers, mid),
    do: binary_search1(numbers, key, mid + 1, right, div(mid + 1 + right, 2))

  defp binary_search1(numbers, key, left, right, mid),
    do: binary_search1(numbers, key, left, mid - 1, div(left + mid - 1, 2))



  # method 2
  defp binary_search2(_, _, left, right) when left > right, do: :not_found

  defp binary_search2(numbers, key, left, right) do
    mid_idx = div(left + right, 2)
    mid_val = elem(numbers, mid_idx)

    cond do
      mid_val == key -> {:ok, mid_idx}
      key < mid_val -> binary_search2(numbers, key, left, mid_idx - 1)
      key > mid_val -> binary_search2(numbers, key, mid_idx + 1, right)
    end
  end
end

