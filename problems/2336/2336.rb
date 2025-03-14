# 2336. Smallest Number in Infinite Set - Medium
# pop_smallest() pops the smallest number from the infinite set of natural numbers.
# add_back(num) adds a number to the infinite set. It can be called when the number already exists.

require 'algorithms' # not needed if running in LeetCode

class SmallestInfiniteSet
  def initialize()
    @heap = Containers::MinHeap.new
    @smallest = 1  # smallest number in the set
  end

  def pop_smallest()
    if @heap.empty?
      smallest = @smallest
      @smallest += 1
      smallest
    else
      @heap.pop
    end
  end

  def add_back(num)
    if num < @smallest && !@heap.has_key?(num)
      @heap.push num
    end
  end
end

# Test
sis = SmallestInfiniteSet.new
sis.add_back(2)  # Adding an existing number does nothing, for it is a set.
puts sis.pop_smallest() # Output: 1
puts sis.pop_smallest() # Output: 2
puts sis.pop_smallest() # Output: 3
sis.add_back(1)
sis.add_back(1)  # Adding the same number twice only adds once, for it is a set.
puts sis.pop_smallest() # Output: 1
puts sis.pop_smallest() # Output: 4
puts sis.pop_smallest() # Output: 5
