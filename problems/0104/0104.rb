# 0104. Maximum Depth of Binary Tree - Easy

def max_depth(root)
  return 0 if root.nil?

  lmax = max_depth(root.left)
  rmax = max_depth(root.right)
  return [lmax, rmax].max + 1
end

# test

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def build_tree(arr)
  return nil if arr.empty?

  root = TreeNode.new(arr.shift)
  q = [root]

  while !arr.empty?
    node = q.shift
    left_val = arr.shift
    right_val = arr.shift

    unless left_val.nil?
      node.left = TreeNode.new(left_val)
      q << node.left
    end

    unless right_val.nil?
      node.right = TreeNode.new(right_val)
      q << node.right
    end
  end

  root
end

input = [3, 9, 20, nil, nil, 15, 7]
root = build_tree(input)
puts max_depth(root)  # Output: 3

input = [1, nil, 2]
root = build_tree(input)
puts max_depth(root)  # Output: 2

input = []
root = build_tree(input)
puts max_depth(root)  # Output: 0
