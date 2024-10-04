# 283. Move Zeroes

def move_zeroes(nums)
  len = nums.length

  # find the index of first zero
  iz = 0
  (0..len-1).each do |i|
    if nums[i] == 0
      iz = i
      break
    end
  end

  # find the index of first non-zero after the first zero
  inz = iz
  (iz..len-1).each do |i|
    if nums[i] != 0
      inz = i
      break
    end
  end

  # move inz through the rest of the array
  while (inz <= len-1) do
    if nums[iz] == 0 && nums[inz] != 0
      nums[iz], nums[inz] = nums[inz], nums[iz]  # swap
      iz += 1
      inz += 1
    else
      inz += 1
    end
  end
end

# test

nums = [0,1,0,3,12]
move_zeroes(nums)
p nums # Output: [1,3,12,0,0]

nums = [0]
move_zeroes(nums)
p nums # Output: [0]

nums = [1,0]
move_zeroes(nums)
p nums # Output: [1,0]

nums = [0,1,0,0,3,12,0]
move_zeroes(nums)
p nums # Output: [1,3,12,0,0,0,0]
