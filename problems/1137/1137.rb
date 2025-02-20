# 1137. N-th Tribonacci Number - Easy

$tribo = [0, 1, 1]

def tribonacci(n)
  return $tribo[n] if $tribo[n]

  $tribo[n] = tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
end

# Test

n = 4
puts tribonacci(n) # Output: 4

n = 25
puts tribonacci(n) # Output: 1389537

