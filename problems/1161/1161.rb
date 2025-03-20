# 1161. Maximum Level Sum of a Binary Tree - Medium

def max_level_sum(root)
  scoreboard={ highest_sum: -100001, highest_level: 0 }
  traverse_level([root], 1, scoreboard)
  scoreboard[:highest_level]
end

def traverse_level(q, level, scoreboard)
  sum = 0
  q.size.times do
    node = q.shift
    sum += node.val
    q << node.left if node.left
    q << node.right if node.right
  end 

  if sum > scoreboard[:highest_sum]
    scoreboard[:highest_sum] = sum
    scoreboard[:highest_level] = level
  end

  traverse_level(q, level+1, scoreboard) if !q.empty?
end

# Tests
require_relative '../lib/binary_tree'

root = BinaryTree::build([1, 7, 0, 7, -8, nil, nil])
puts max_level_sum(root)  # 2

root = BinaryTree::build([989, 10250, 98693, -89388, nil, nil, nil, nil, -32127])
puts max_level_sum(root)  # 2

root = BinaryTree::build([-100, -200, -300, -20, -5, -10, nil])
puts max_level_sum(root)  # 3
