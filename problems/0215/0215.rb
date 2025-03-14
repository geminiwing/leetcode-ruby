# 215. Kth Largest Element in an Array - Medium

require 'algorithms'  # does not require this in LeetCode

# solution using a min heap
def find_kth_largest(nums, k)
  heap = Containers::MinHeap.new

  k.times do |i|
    heap.push nums[i]
  end

  (k..nums.size-1).each do |i|
    if nums[i] > heap.min
      heap.pop
      heap.push nums[i]
    end
  end

  heap.min
end

# Test
nums = [3,2,1,5,6,4]
k = 2
puts find_kth_largest(nums, k) # Output: 5

nums = [3,2,3,1,2,4,5,5,6]
k = 4
puts find_kth_largest(nums, k) # Output: 4
