defmodule LogLevel do
  @moduledoc """
  Write a small program that will aggregate given logs, and give them labels according to their severity level.
  Some of the legacy applications don't support all the codes.

  Link: https://exercism.org/tracks/elixir/exercises/log-level
  """
  @spec to_label(level :: integer(), legacy? :: boolean()) :: atom()
  def to_label1(level, legacy?) do
    case {level, legacy?} do
      {0, false} -> :trace
      {1, _} -> :debug
      {2, _} -> :info
      {3, _} -> :warning
      {4, _} -> :error
      {5, false} -> :fatal
      _ -> :unknown
    end
  end

  def to_label2(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end


  @spec alert_recipient(level :: integer(), legacy? :: boolean()) :: atom() | boolean()
  def alert_recipient1(level, legacy?) do
    case to_label(level, legacy?) do
      label when label in [:error, :fatal] -> :ops
      :unknown when legacy? -> :dev1
      :unknown -> :dev2
      _ -> false
    end
  end

  def alert_recipient2(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end

