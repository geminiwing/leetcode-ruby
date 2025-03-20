# 872. Leaf-Similar Trees

def leaf_similar(root1, root2)
  output1 = []
  output2 = []
  df_leaf(root1, output1)
  df_leaf(root2, output2)
  return output1 == output2
end

def df_leaf(root, output)
  if root.left.nil? && root.right.nil?
    output << root.val 
    return
  end

  df_leaf(root.left, output) if root.left
  df_leaf(root.right, output) if root.right
end

# Tests

require_relative '../lib/binary_tree'

root1 = BinaryTree::build([3,5,1,6,2,9,8,nil,nil,7,4])
root2 = BinaryTree::build([3,5,1,6,7,4,2,nil,nil,nil,nil,nil,nil,9,8])
puts leaf_similar(root1, root2) # Expected: true

root1 = BinaryTree::build([1,2,3])
root2 = BinaryTree::build([1,3,2])
puts leaf_similar(root1, root2) # Expected: false
