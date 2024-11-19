# 206. Reverse Linked List - Easy

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
