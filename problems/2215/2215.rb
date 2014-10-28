# 2215. Find the Difference Between Two Arrays - Easy

def find_difference(nums1, nums2)
  nums1.uniq!
  nums2.uniq!
  ans0 = (nums1 - nums2)
  ans1 = (nums2 - nums1)
  [ans0, ans1]
end
