import Bitwise

defmodule Secrets do
  @moduledoc """
  Provides simple functions that can be combined to transform data for an encryption device.
  Each task returns an anonymous function that can be invoked from the calling scope.
  """
  @type int_fn :: (integer() -> integer())

  @spec secret_add(secret :: integer()) :: int_fn()
  def secret_add(secret), do: fn n -> secret + n end
  def secret_add2(secret), do: &(&1 + secret)  # &1 is the argument not included in param list

  @spec secret_subtract(secret :: integer()) :: int_fn()
  def secret_subtract(secret), do: fn n -> n - secret end
  def secret_subtract2(secret), do: &(&1 - secret)

  @spec secret_multiply(secret :: integer()) :: int_fn()
  def secret_multiply(secret), do: fn n -> n * secret end
  def secret_multiply2(secret), do: &(&1 * secret)

  @spec secret_divide(secret :: integer()) :: int_fn()
  def secret_divide(secret), do: fn n -> div(n, secret) end
  def secret_divide2(secret), do: &trunc(&1 / secret) # trunc/1 or div/2

  @spec secret_and(secret :: integer()) :: int_fn()
  def secret_and(secret), do: fn n -> Bitwise.band(secret, n) end  # doesn't require import
  def secret_and2(secret), do: &(secret &&& &1)

  @spec secret_xor(secret :: integer()) :: int_fn()
  def secret_xor(secret), do: fn n -> Bitwise.bxor(secret, n) end  # doesn't require import
  def secret_xor2(secret), do: &bxor(secret, &1)

  @spec secret_combine(int_fn(), int_fn()) :: int_fn()
  def secret_combine(f, g), do: fn n -> f.(n) |> g.() end
  def secret_combine2(f, g), do: &(&1 |> f.() |> g.())
  # takes one argument (n not in param list) and applies to it the two functions in order
end

