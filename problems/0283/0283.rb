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
