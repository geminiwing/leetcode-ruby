# 62. Unique Paths - Medium

def unique_paths(m, n)
  memo = Array.new(m) { Array.new(n) }  # define a 2D array of m*n (m rows and n columns)
  memo[0][0] = 1
  y = m-1
  x = n-1

  paths(memo, y, x)
end

def paths(memo, y, x)
  return memo[y][x] if memo[y][x]
  return 0 if y < 0 || x < 0

  memo[y][x] = paths(memo, y-1, x) + paths(memo, y, x-1)
end

# Test

m = 3
n = 2
puts unique_paths(m, n) # Output: 3

m = 3
n = 7
puts unique_paths(m, n) # Output: 28
