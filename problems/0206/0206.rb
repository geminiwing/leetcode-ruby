# 206. Reverse Linked List - Easy

# iterative solution
def reverse_list(head)
  return head if head.next.nil?

  p1 = head
  p2 = p1&.next
  p3 = p2&.next

  p1.next = nil
  while !p2.nil?
    p2.next = p1
    p1 = p2
    p2 = p3
    p3 = p3&.next
  end

  return p1
end

# recurssive solution
def reverse_list(head)
  return head if head&.next.nil?

  flip(nil, head)
end

def flip(prev, curr)
  next_node = curr.next # save next node
  curr.next = prev      # flip the next pointer
  if next_node.nil?
    curr # This is the last node that will be the new head
  else
    flip(curr, next_node)
  end
end

# test

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

n5 = ListNode.new(5, nil)
n4 = ListNode.new(4, n5)
n3 = ListNode.new(3, n4)
n2 = ListNode.new(2, n3)
n1 = ListNode.new(1, n2)
head = n1

new_head = reverse_list(head)

p = new_head
while(p != nil)
  puts p.val
  p = p.next
end

# Output: 5 4 3 2 1
