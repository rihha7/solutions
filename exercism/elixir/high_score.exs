defmodule HighScore do
  @moduledoc """
  Implement a way to keep track of the high scores for the most popular game in your local arcade hall.

  - For `add_player/3`, set the players score to 0 if a score is not provided.
  - For `reset_score/2`, `update_score/3` and `get_players/1`, the function should work if the player doesn't have a score and/or if there are no players.
  
  Link: https://exercism.org/tracks/elixir/exercises/high-score
  """
  @default_score 0

  @spec new() :: %{}
  def new(), do: %{}

  @spec add_player(%{optional(String.t()) => integer()}, String.t(), integer()) :: %{required(String.t()) => integer()}
  def add_player(scores, name, score \\ @default_score), do: Map.put(scores, name, score)

  @spec remove_player(%{optional(String.t()) => integer()}, String.t()) :: %{optional(String.t()) => integer()}
  def remove_player(scores, name), do: Map.drop(scores, [name])
  def remove_player2(scores, name) do
    {_, result} = Map.pop(scores, name)
    result
  end

  @spec reset_score(%{optional(String.t()) => integer()}, String.t()) :: %{required(String.t()) => integer()}
  def reset_score(scores, name), do: Map.put(scores, name, @default_score)

  @spec update_score(%{optional(String.t()) => integer()}, String.t(), integer()) :: %{required(String.t()) => integer()}
  def update_score(scores, name, score), do: Map.update(scores, name, score, &(&1 + score))
  
  @spec get_players(%{optional(String.t()) => integer()}) :: [String.t()]
  def get_players(scores), do: Map.keys(scores)
end
