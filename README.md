# leetcode-ruby
Solutions for LeetCode problems.

## Ruby Essentials for LeetCode Goers

### Array
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

### Array Iteration

#### Using elements
```rb
prices = [1, 2, 3, 4, 5]

prices.each {|e| puts e}
# 1 2 3 4 5

prices.reverse.each {|e| puts e}
# 5 4 3 2 1
```

#### Using an index
```rb
# Forward scan
(0..prices.length-1).each { |i| puts prices[i] }
# 1 2 3 4 5

# Reverse scan
(prices.length - 1).downto(0) { |i| puts prices[i] }
# 5 4 3 2 1
```

HEADS UP: Ranges do not work in reverse order
```rb
(0..4).each {|i| puts prices[i]}
# 0 1 2 3 4

(4..0).each {|i| puts prices[i]}
# nothing printed
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
Chaining doesn't work if the value is `nil`.
```rb
h = {a: 1, b: {c: 3, d: 4}}

h[:b]      # => {:c=>3, :d=>4}
h[:b][:c]  # => 3

h[:e]      # => nil
h[:e][:c]  # undefined method `[]' for nil (NoMethodError)
```

Use `dig` for safe navigation with `nil`s.
```rb
h.dig(:e)      # => nil
h.dig(:e, :c)  # => nil
```

### Hash Default Value

When a key is missing, hash returns a default value.
```rb
h = Hash.new      # Default is nil
h[:a]             # :a is missing, return nil
# => nil
```

You can set a default value.
```rb
h = Hash.new(0)   # Default is 0
h[:a]             # :a is missing, return 0
# => 0
h                 # h is empty
# => {}
h[:a] += 1        # Assigning h[:a] = h[:a] + 1
# => 1
h
# {:a=>1}
```

Let's say you want to use an array as a default value, and add elements to it.
```rb
h2 = Hash.new([]) # Default is an empty array
h2[:a]            # :a is missing, return the default []
# => []
h2[:a] << 1       # This does not set h2[:a]. It only adds 1 to the default [].
# => [1]
h2                # h2 is still empty
# => {}
h2[:a]            # :a is still missing, return the default [1]
# => [1]
```

This is not what we want. Use a block to define a default behavior to set [] for empty keys
```rb
h3 = Hash.new { |h, k| h[k] = [] }
h3[:a]            # :a is missing, assign [] to :a
# => []           # h3 is {:a=>[]}
h3[:a] << 1
# => [1]          # h3 is {:a=>[1]}
h3
# {:a=>[1]}
```

## String

Use `..` to select a substring.
```rb
str = 'Hello'

rotated_left = str[1..-1] + str[0]   # => "elloH"
rotated_right = str[-1] + str[0..-2] # => "oHell"
```

## Regex

Use `()` to extract the matches you want.
```rb
log = '2024-02-11T07:13:22 method=GET path=/api/v1/login host=xcom.games.com status=200 latency=10ms'
regex = /method=(\w+) path=([\/\.\w]+) host=(.*) .* latency=(\d+)ms/

matches = log.match(regex)
matches[1] # => "GET"
matches[2] # => "/api/v1/login"
matches[3] # => "xcom.games.com"
matches[4] # => "10"
```

```
