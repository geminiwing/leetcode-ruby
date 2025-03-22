# 2095. Delete the Middle Node of a Linked List - Medium
# When a list of n nodes is given, the middle node is the (n/2)th node.
def delete_middle(head)
  return nil if head.next.nil?  # when there's only 1 node

  # count the number of nodes
  count = 0
  p = head
  while(p)
    count += 1
    p = p.next
  end

  # find the middle node
  middle_count = count / 2
  p1 = head
  p2 = nil
  middle_count.times do |_|
    p2 = p1
    p1 = p1.next
  end

  # delete the middle node
  p2.next = p1.next
  head
end

# Tests
require_relative '../lib/linked_list.rb'

head = LinkedList::build_list([1,3,4,7,1,2,6])
head = delete_middle(head)
LinkedList::print_values(head) # 1 3 4 1 2 6

head = LinkedList::build_list([1, 2, 3, 4])
head = delete_middle(head)
LinkedList::print_values(head) # 1 2 4

head = LinkedList::build_list([2, 1])
head = delete_middle(head)
LinkedList::print_values(head) # 2

head = LinkedList::build_list([2])
head = delete_middle(head)
LinkedList::print_values(head) # nil
