# 0104. Maximum Depth of Binary Tree - Easy

def max_depth(root)
  return 0 if root.nil?

  lmax = max_depth(root.left)
  rmax = max_depth(root.right)
  return [lmax, rmax].max + 1
end
