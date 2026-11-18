defmodule Solution do
  @moduledoc """
  [605] Can Place Flowers (4)

  Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  Examples:
    can_place_flowers([1,0,0,0,1], 1)
    => true

    can_place_flowers([1,0,0,0,1], 2)
    => false

  Testcases:
    [1,0,0,0,1], 1
    [1,0,0,0,1], 2
    [1,0,0,0,1], 1
    [0,0,1,0,0], 1
    [1,0,1,0,1,0,1], 0
    [0,0,1,0,0,0,0,0,1,0,0], 4
    [1,0,0,0,0,0,1], 2
    [0], 1
    [1,0,0,0,0,1], 2

  Link: https://leetcode.com/problems/can-place-flowers
  """
  @spec can_place_flowers(flowerbed :: [integer], n :: integer) :: boolean
  def can_place_flowers(_, 0), do: true

  def can_place_flowers(flowerbed, n) do
    t_flowerbed = List.to_tuple(flowerbed)
    last_idx = tuple_size(t_flowerbed) - 1

    Enum.reduce_while(0..last_idx, {0, false}, fn idx, {count, prev_placed} ->
      can_place =
        elem(t_flowerbed, idx) == 0 and \
        not prev_placed and \
        (idx == 0 or elem(t_flowerbed, idx - 1) == 0) and \
        (idx == last_idx or elem(t_flowerbed, idx + 1) == 0)

      case can_place do
        true when count + 1 >= n -> {:halt, true}
        true -> {:cont, {count + 1, true}}
        false -> {:cont, {count, false}}
      end
    end)
    |> case do
      true -> true
      _ -> false
    end
  end 
end
