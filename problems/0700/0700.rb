# 700. Search in a Binary Search Tree - Easy

def search_bst(root, val)
  return root if root == nil
  return root if val == root.val

  if val < root.val
    search_bst(root.left, val)
  else
    search_bst(root.right, val)
  end
end
