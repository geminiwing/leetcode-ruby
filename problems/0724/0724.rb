# 0724. Find Pivot Index - Easy
# Time comlexity: O(n)
# Space complexity: O(n)

def pivot_index(nums)
  lsum = 0
  rsum = nums.sum
  len = nums.length

  (0..len-1).each do |i|
    rsum -= nums[i]
    return i if lsum == rsum

    lsum += nums[i]
  end

  return -1
end

# Tests

nums = [1,7,3,6,5,6]
puts pivot_index(nums) # 3

nums = [1,2,3]
puts pivot_index(nums) # -1

nums = [2,1,-1]
puts pivot_index(nums) # 0
