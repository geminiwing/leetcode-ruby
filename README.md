# leetcode-ruby

Solutions for LeetCode problems.


## Ruby Essentials for LeetCode Goers

### Looping Through Index
Using an index is useful when accessing arrays forward or backward.
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

Also useful for finding min, max, or sum.
```rb
[1,3].min               # => 1
[1,3].max               # => 3
[1,2,3].sum             # => 6
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

memo = Array.new(m) { Array.new(n, 0) }
# [[0, 0], [0, 0], [0, 0]]

# Access with two brackets
puts memo[2][1]
```

### Multiple Assignments
No need for a temporary variable when swapping.
```rb
x, y = y, x
```

Arrays are automatically destructured when assigned to multiple variables.
```rb
word1, word2 = ['abc', 'abcdef']
```

Useful when finding the shorter of two given words.
```rb
def do_something(word1, word2)
  short, long = word1.size < word2.size ? [word1, word2] : [word2, word1]
  ...
end
```

Convenient to save and load simple data without using Struct or Hash.
```rb
queue = []
queue << [y, x, count]    # enqueue
y, x, count = queue.shift # dequeue and destructure
```

## Hash
Chaining may end up with an error.
```rb
h = {a: 1, b: {c: 3, d: 4}}

h[:b][:c]  # => 3

h[:f][:c]  # undefined method `[]' for nil (NoMethodError)
```

Use `dig` for safe navigation
```rb
h.dig(:f, :c)  # => nil
```
