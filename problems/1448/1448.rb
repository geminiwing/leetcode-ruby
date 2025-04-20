# 1448. Count Good Nodes in Binary Tree - Medium
# A node X in a tree is good if there are no nodes greater than X in the path from root to X.
# Return the number of good nodes in the binary tree.

def good_nodes(root)
  max = root.val
  count = dfs(root, max)
end

def dfs(root, max)
  return 0 if root.nil?

  if root.val >= max
    max = root.val
    count = 1
  else
    count = 0
  end

  count + dfs(root.left, max) + dfs(root.right, max)
end

# Test cases

require_relative '../lib/binary_tree'

nums = [3,1,4,3,nil,1,5]
root = BinaryTree.build(nums)
puts good_nodes(root) # Output: 4

nums = [3,3,nil,4,2]
root = BinaryTree.build(nums)
puts good_nodes(root) # Output: 3

nums = [1]
root = BinaryTree.build(nums)
puts good_nodes(root) # Output: 1
