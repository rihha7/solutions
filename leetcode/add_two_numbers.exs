# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @moduledoc """
  [2] Add Two Numbers

  You are given two non-empty linked lists representing two non-negative integers.
   -> each node in a linked list: [item, [ref_next_node]]
  The digits are stored in reverse order, and each of their nodes contains a single digit.
  Add the two numbers and return the sum as a linked list.
  You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  Link: https://leetcode.com/problems/add-two-numbers/
  """
  @spec add_two_numbers(l1 :: ListNode.t | nil, l2 :: ListNode.t | nil) :: ListNode.t | nil

  def add_two_numbers(l1, l2), do: add(l1, l2, 0)

  defp add(nil, nil, 0), do: nil

  defp add(l1, l2, carry) do
    v1 = if l1, do: l1.val, else: 0
    v2 = if l2, do: l2.val, else: 0

    next1 = if l1, do: l1.next, else: nil
    next2 = if l2, do: l2.next, else: nil
    
    total = v1 + v2 + carry

    %ListNode{
      val: rem(total, 10),
      next: add(next1, next2, div(total, 10))
    }
  end
end

