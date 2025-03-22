module BinaryTree
  class TreeNode
    attr_accessor :val, :left, :right

    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
  end

  # Construct a binary tree from a sparse array
  def build(arr)
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
  module_function :build

  def to_array(node)
    return [] if node.nil?
  
    result = []
    q = [node]
    while q.compact.any?
      n = q.shift
      result << n&.val
      q << n&.left
      q << n&.right
    end
    result
  end
  module_function :to_array
end
