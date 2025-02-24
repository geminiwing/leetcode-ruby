# 198. House Robber - Medium

def rob(nums)
  mem = []
  last = nums.length-1

  rob1 = rob!(mem, nums, last)
  rob2 = rob!(mem, nums, last-1)
  [rob1, rob2].max
end

def rob!(mem, nums, i)
  return 0 if i < 0
  return mem[i] if mem[i]

  rob1 = nums[i] + rob!(mem, nums, i-2)
  rob2 = nums[i] + rob!(mem, nums, i-3)
  mem[i] = [rob1, rob2].max
end

# Test

nums = [1,2,3,1]
puts rob(nums) # Output: 4

nums = [2,7,9,3,1]
puts rob(nums) # Output: 12
