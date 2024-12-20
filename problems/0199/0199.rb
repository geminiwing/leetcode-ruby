# 199. Binary Tree Right Side View - Medium
require_relative '../lib/binary_tree'

def right_side_view(root)
  return [] if root.nil?

  q = [root]
  result = []

  while !q.compact.empty?
    result << q[-1].val # The right-most non-nil value

    q.size.times do |_| # For all nodes of the current level,
      node = q.shift                          # dequeue the node
      q << node.left unless node.left.nil?    # enqueue the children
      q << node.right unless node.right.nil?
    end
  end

  result
end

# test

input = [1,2,3,nil,5,nil,4]
root = BinaryTree.build(input)
puts right_side_view(root) # Output: 1, 3, 4
puts

input = [1,2,3,4,nil,nil,nil,5]
root = BinaryTree.build(input)
puts right_side_view(root) # Output: 1, 3, 4, 5
puts

input = [1,nil,3]
root = BinaryTree.build(input)
puts right_side_view(root) # Output: 1, 3
puts

input = []
root = BinaryTree.build(input)
puts right_side_view(root) # Output: []
puts

input = [23,28,nil,21,nil,6,19,48,8,nil,nil,nil,nil,22,31,nil,nil,4,36,34,30,nil,nil,nil,nil,27,2,nil,nil,3,26,nil,nil,55,nil,1,nil,15,41,nil,nil,37,39,14,51,nil,nil,nil,nil,46,nil,32,12,nil,nil,45,9,nil,nil,29,10,nil,nil,nil,18,43,25,47,50,nil,7,nil,nil,nil,nil,40,44,17,nil,nil,nil,49,nil,35,20,11,54,53,5,nil,nil,52,33,nil,nil,nil,16,nil,nil,42,38,nil,nil,nil,nil,13,24,nil,nil,nil,nil]
root = BinaryTree.build(input)
puts right_side_view(root) # Output: 23,28,21,19,8,31,36,30,2,26,55,1,41,39,51,46,12,9,10,18,25,7,44,17,49,20,5,16,38,24
puts
