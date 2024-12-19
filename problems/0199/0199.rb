# 199. Binary Tree Right Side View - Medium

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
