# leetcode-ruby

Solutions for LeetCode problems.


## Ruby Essentials for LeetCode Goers

### Looping Through Index
Using an index is useful when accessing arrays in a certain order.
```rb
prices = [7, 1, 5, 3, 6, 4]

maxes = Array.new(prices.length, 0)  # 배열을 초기화하는 방법

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
