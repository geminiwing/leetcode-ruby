# 0104. Maximum Depth of Binary Tree - Easy
require_relative '../lib/binary_tree'

def max_depth(root)
  return 0 if root.nil?

  lmax = max_depth(root.left)
  rmax = max_depth(root.right)
  return [lmax, rmax].max + 1
end

# test

input = [3, 9, 20, nil, nil, 15, 7]
root = BinaryTree.build(input)
puts max_depth(root)  # Output: 3

input = [1, nil, 2]
root = BinaryTree.build(input)
puts max_depth(root)  # Output: 2

input = []
root = BinaryTree.build(input)
puts max_depth(root)  # Output: 0
