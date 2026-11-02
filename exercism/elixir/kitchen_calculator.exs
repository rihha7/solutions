defmodule KitchenCalculator do
  @moduledoc """
  Converts measurements used in a recipe between the US imperial system and the metric system.

  Link: https://exercism.org/tracks/elixir/exercises/kitchen-calculator
  """
  @spec get_volume({atom(), float()}) :: float()
  def get_volume({_, volume}), do: volume
  def get_volume2(volume_pair), do: elem(volume_pair, 1)

  @spec to_milliliter({atom(), float()}) :: {atom(), float()}
  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15}
  def to_milliliter(volume_pair), do: volume_pair

  @spec from_milliliter({atom(), float()}, unit :: atom()) :: {atom(), float()}
  def from_milliliter({_, volume}, :cup), do: {:cup, volume / 240}
  def from_milliliter({_, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}
  def from_milliliter({_, volume}, :teaspoon), do: {:teaspoon, volume / 5}
  def from_milliliter({_, volume}, :tablespoon), do: {:tablespoon, volume / 15}
  def from_milliliter(volume_pair, :milliliter), do: volume_pair
  
  @spec convert({atom(), float()}, unit :: atom()) :: {atom(), float()}
  def convert({current, volume}, target),
    do: to_milliliter({current, volume}) |> from_milliliter(target)
end

