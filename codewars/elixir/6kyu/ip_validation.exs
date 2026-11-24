defmodule Solution do
  @moduledoc """
  [7kyu] IP Validation

  Write an algorithm that will identify valid IPv4 addresses in dot-decimal format. IPs should be considered valid if they consist of four octets, with values between 0 and 255, inclusive.
  Leading zeros (e.g. 01.02.03.04) are considered invalid.

  Examples of valid inputs:
    1.2.3.4
    123.45.67.89

  Examples of invalid inputs:
    1.2.3
    1.2.3.4.5
    123.456.78.90
    123.045.067.089

  Link: https://www.codewars.com/kata/515decfd9dcfc23bb6000006/train/elixir
  """
  @spec is_valid_ip(ip :: String.t()) :: boolean()
  def is_valid_ip(ip) do
    octets = String.split(ip, ".")
    length(octets) == 4 and Enum.all?(octets, &is_valid/1)
  end
  
  defp is_valid(octet) do
    case Integer.parse(octet) do
      {n, ""} when n in 0..255 ->
        octet == "0" or (not String.starts_with?(octet, "0"))
      _ -> false
    end
  end
end
