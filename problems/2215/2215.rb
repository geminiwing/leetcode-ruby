# 2215. Find the Difference Between Two Arrays - Easy

def find_difference(nums1, nums2)
  nums1.uniq!
  nums2.uniq!
  ans0 = (nums1 - nums2)
  ans1 = (nums2 - nums1)
  [ans0, ans1]
end

# test

nums1 = [1,2,3]
nums2 = [2,4,6]
p find_difference(nums1, nums2)  # Output: [[1,3],[4,6]]

nums1 = [1,2,3,3]
nums2 = [1,1,2,2]
p find_difference(nums1, nums2)  # Output: [[3],[]]
