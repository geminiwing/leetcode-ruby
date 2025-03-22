# 450. Delete Node in a BST - Medium

# This function returns the root or a child of the root if it deletes the root.
def delete_node(root, key)
  return if root.nil?

  if key < root.val
    root.left = delete_node(root.left, key)
  elsif key > root.val
    root.right = delete_node(root.right, key)
  else # key == root.val
    # if root is a leaf. In fact, this case is not needed, for the next case will result the same.
    if root.left.nil? && root.right.nil?
      return nil
    end

    # if root has one child
    if root.left.nil?
      return root.right
    elsif root.right.nil?
      return root.left
    end

    # if root has two childern
    succ = find_successor(root.right)
    root.val = succ.val
    root.right = delete_node(root.right, succ.val)
  end

  return root
end

# returns the smallest node in the tree
def find_successor(root)
  node = root
  while node.left do
    node = node.left
  end

  return node
end

# Tests

require_relative '../lib/binary_tree'

root = BinaryTree.build([5, 3, 6, 2, 4, nil, 7])
puts BinaryTree.to_array(root).to_s    # [5, 3, 6, 2, 4, nil, 7]
root = delete_node(root, 3)
puts BinaryTree.to_array(root).to_s    # [5, 4, 6, 2, nil, nil, 7]

root = BinaryTree.build([5, 3, 6, 2, 4, nil, 7])
puts BinaryTree.to_array(root).to_s    # [5, 3, 6, 2, 4, nil, 7]
root = delete_node(root, 0)
puts BinaryTree.to_array(root).to_s    # [5, 3, 6, 2, 4, nil, 7]

root = BinaryTree.build([])
puts BinaryTree.to_array(root).to_s    # []
root = delete_node(root, 0)
puts BinaryTree.to_array(root).to_s    # []
