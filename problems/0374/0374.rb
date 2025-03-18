# 374. Guess Number Higher or Lower - Easy
# A predefined function guess(int num) is provided, which returns:
# -1 if num is higher than the picked number
#  0 if num is equal to the picked number
#  1 if num is lower than the picked number

def guessNumber(n)
  guessBetween(1, n)
end

def guessBetween(low, high)
  mid = (low + high) / 2

  case guess(mid)
  when -1  # mid is higher than the pick
    guessBetween(low, mid-1)
  when 1   # mid is lower than the pick
    guessBetween(mid+1, high)
  when 0
    mid
  end
end

# Tests

# This function is not needed if running in LeetCode
def guess(num)
  $pick <=> num
end

n = 10
$pick = 6
puts guessNumber(n)   # 6

n = 1
$pick = 1
puts guessNumber(n)   # 1

n = 2
$pick = 1
puts guessNumber(n)   # 1
