# leetcode-ruby

Solutions for LeetCode problems.


## Ruby Essentials for LeetCode Goers

### Looping Through Index
Using an index is useful when accessing arrays in a certain order.
```rb
prices = [7, 1, 5, 3, 6, 4]

# Forward scan
(0..prices.length-1).each do |i|
  puts prices[i]
end

# Reverse scan
(prices.length - 1).downto(0) do |i|
  puts prices[i]
end
```

HEADS UP: Ranges do not work in a reverse order
```rb
(0..9).each {|i| puts i}  
# 0 1 2 3 4 5 6 7 8 9

(9..0).each {|i| puts i}
# 9..0 <= WTF?
```

## Array
Arrays come with stack & queue operations out of the box.
```rb
arr = [1, 2]

arr << 3        # push
# => [1, 2, 3]
arr.pop         # pop        [1, 2]
# => 3

arr << 3        # enqueue
# => [1, 2, 3]
arr.shift       # dequeue    [2, 3]
# => 1
arr.unshift(1)  # add to head
# => [1, 2, 3]

arr.rotate!      # rotate right
# => [2, 3, 1]
arr.rorate!(-1)  # rotate left
# => [1, 2, 3]

a.delete_at(1)   # by index   [1, 3]
# => 2
a.delete(3)      # by element [1]
# => 3
```

### Array Initialization
Initializing 1D array
```rb
n = 10
visited = Array.new(n, false)
# [false, false, false, false, false, false, false, false, false, false]
```

2D arrays are essential for dynamic programming.
```rb
# Create a 2D array of m*n (m rows * n columns)
m = 3
n = 2

memo = Array.new(m) { Array.new(n)}
# [[nil, nil], [nil, nil], [nil, nil]]

memo = Array.new(m) { Array.new(n, 0} }
# [[0, 0], [0, 0], [0, 0]]
```
