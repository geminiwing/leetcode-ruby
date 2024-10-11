# 0643. Maximum Average Subarray I - Easy

def find_max_average(nums, k)
  i1 = 0       # window beginning index
  i2 = k - 1   # window ending index
  len = nums.length
  top_sum = 0
  sum = 0

  # find the sum of the first k elements
  (i1..i2).each do |i|
    sum += nums[i]
  end
  puts sum

  top_sum = sum

  i2 += 1
  while i2 < len do
    sum = sum + nums[i2] - nums[i1]
    top_sum = sum if top_sum < sum
    i1 += 1
    i2 += 1
  end

  return top_sum.to_f / k
end

# test

nums = [1,12,-5,-6,50,3]
k = 4
puts find_max_average(nums, k)  # Output: 12.75

nums = [5]
k = 1
puts find_max_average(nums, k)  # Output: 5.0
