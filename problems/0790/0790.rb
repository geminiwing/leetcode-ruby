# 790. Domino and Tromino Tiling - Medium
# Given an integer n, return the number of ways to tile an 2 x n board.
# Since the answer may be very large, return it modulo 10^9 + 7.
DIVIDER = 1000000007

def num_tilings(n)
  index = n-1    # 0 based index
  mem = [1, 2]

  count = fill(mem, index)
  return count % DIVIDER
end

# When the ith place is fully blank (both upper and lower)
def fill(mem, i)
  return mem[i] if mem[i]

  count_1 = fill(mem, i-1)       # put a ⠆ tile and advance by 1
  count_2 = fill(mem, i-2)       # put two ⠒ tiles (⠶) and advance by 2
  count_p = 2 * fill_p(mem, i-1) # put a ⠙ tile OR ⠚ tile and advance by 1

  mem[i] = count_1 + count_2 + count_p
end

# When the ith place is partially blank (either upper or lower tile is filled)
def fill_p(mem, i)
  if i == 0
    raise 'not a possible move'
  elsif i == 1
    1
  else # i >= 2
    # put a ⠒ tile and advance by 1 OR put a ⠋ (or ⠦) tile and advance by 2
    fill_p(mem, i-1) + fill(mem, i-2)
  end
end

# Test

n = 1
puts num_tilings(n) # 1

n = 2
puts num_tilings(n) # 2

n = 3
puts num_tilings(n) # 5

n = 4
puts num_tilings(n) # 11

n = 5
puts num_tilings(n) # 24

n = 30
puts num_tilings(n) # 312342182
