# 0338. Counting Bits - Easy

def count_bits(n)
  ans = []

  (0..n).each do |i|
    binary = i.to_s(2)
    count = 0
    binary.each_char do |bit|
      count += 1 if bit == '1'
    end
    ans << count
  end

  return ans
end

# tests
n = 2
puts count_bits(n).to_s # Output: [0,1,1]

n = 5
puts count_bits(n).to_s # Output: [0,1,1,2,1,2]
