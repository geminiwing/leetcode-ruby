module LinkedList
  class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
    end
  end

  # build a single linked list from an array
  def build_list(nums)
    head = nil

    while !nums.empty?
      head = ListNode.new(nums.pop, head)
    end

    head
  end

  def print_values(head)
    p = head
    while p
      print "#{p.val} "
      p = p.next
    end
    puts
  end

  module_function :build_list, :print_values
end