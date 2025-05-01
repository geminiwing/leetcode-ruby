# 215. Kth Largest Element in an Array - Medium

require 'algorithms'  # does not require this in LeetCode

# solution using a min heap
def find_kth_largest(nums, k)
  # Need a "min" heap to find the kth "largest" element
  heap = Containers::MinHeap.new

  # Push the first k elements into the heap
  nums[0...k].each {|num| heap.push num }

  # Now push the rest while popping the smallest to maintain size k
  nums[k...nums.size].each do |num|
    if num > heap.min
      heap.pop
      heap.push num
    end
  end

  # The root of the heap is the kth largest element
  heap.min
end

# Test
nums = [3,2,1,5,6,4]
k = 2
puts find_kth_largest(nums, k) # Output: 5

nums = [3,2,3,1,2,4,5,5,6]
k = 4
puts find_kth_largest(nums, k) # Output: 4
