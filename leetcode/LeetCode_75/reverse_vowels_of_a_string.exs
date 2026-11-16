defmodule Solution do
  @moduledoc """
  [345] Reverse Vowels of a String (5)

  Given a string `s`, reverse the order of the GIVEN vowels found in the input string (not according to vowels in general = 'uoiea' ❌).
  They can appear in both lower and upper case, more than once.
  `s` consists of printable ASCII characters (numeric codes from 32 to 126 (a-z, A-Z, 0-9, ! @ # $ % & *, . , ? ; :, whitespaces " ")).

  Examples:
    "IceCreAm"
    => "AceCreIm" ['e', 'e', 'A'] -> ['A', 'e', 'e']

    "leetcode"
    => "leotcede" ['e', 'e', 'o', 'e'] -> ['e', 'o', 'e', 'e']

  Link: https://leetcode.com/problems/reverse-vowels-of-a-string
  """
  @vowels [?a, ?e, ?i, ?o, ?u, ?A, ?E, ?I, ?O, ?U]

  @spec reverse_vowels(s :: String.t) :: String.t
  def reverse_vowels(s) do
    vowels = find_vowels(s, [])
    vowels = vowels |> List.to_tuple

    do_reverse(s, vowels, 0, "")
  end

  defp find_vowels("", vowels), do: vowels # allow it to naturally be in reverse order
  defp find_vowels(<<c::utf8, rest::binary>>, vowels) do
    case c in @vowels do
      true -> find_vowels(rest, [<<c::utf8>>|vowels])
      false -> find_vowels(rest, vowels)
    end
  end


  defp do_reverse(s, {}, _, _), do: s
  defp do_reverse("", _, _, acc), do: acc

  defp do_reverse(<<c::utf8, rest::binary>>, vowels, i, acc) do
    case c in @vowels do
      true ->
        do_reverse(rest, vowels, i + 1, <<acc::binary, elem(vowels, i)::binary>>)
      false ->
        do_reverse(rest, vowels, i, <<acc::binary, c::utf8>>)
    end
  end
end
