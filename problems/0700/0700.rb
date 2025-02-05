# 700. Search in a Binary Search Tree - Easy
require_relative '../lib/binary_tree'

def search_bst(root, val)
  return root if root == nil
  return root if val == root.val

  if val < root.val
    search_bst(root.left, val)
  else
    search_bst(root.right, val)
  end
end

# test

input = [4,2,7,1,3]
root = BinaryTree.build(input)

node = search_bst(root, 2)
puts node&.val # Output: 2

node = search_bst(root, 5)
puts node&.val # Output: nil
