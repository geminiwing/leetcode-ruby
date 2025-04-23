# 2130. Maximum Twin Sum of a Linked List - Medium
# Given the head of a linked list with even length, return the maximum twin sum of the linked list.
# Nodes with the same distance from each end are twins. For example, if length is 4, then 
# node 0 and 3 are twins, so are node 1 and 2.

def pair_sum(head)
  p = head
  fastp = p.next
  stack = []
  max_sum = 0

  while fastp do
    stack.push(p.val)
    p = p.next
    fastp = fastp.next&.next
  end

  while p do
    sum = p.val + stack.pop
    max_sum = [max_sum, sum].max
    p = p.next
  end

  max_sum
end

# Test cases
require_relative '../lib/linked_list'

nums = [5,4,2,1]
head = LinkedList.build_list(nums)
puts pair_sum(head) #=> 6

nums = [4,2,2,3]
head = LinkedList.build_list(nums)
puts pair_sum(head) #=> 7

nums = [1,100000]
head = LinkedList.build_list(nums)
puts pair_sum(head) #=> 100001
