# 739. Daily Temperatures - Medium

# Time complexity: O(n)
# Space complexity: O(n)
def daily_temperatures(temperatures)
  stack = []   # monotonically decreasing stack
  istack = []  # index stack
  output = Array.new(temperatures.size)

  (temperatures.length-1).downto(0).each do |i|
    t = temperatures[i]
    # pop numbers larger than t
    while !stack.empty? && t >= stack.last do
      stack.pop
      istack.pop
    end

    if stack.empty?
      output[i] = 0
    else
      output[i] = istack.last - i
    end

    stack << t
    istack << i
  end

  output
end

# Tests

temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
puts daily_temperatures(temperatures).to_s # [1, 1, 4, 2, 1, 1, 0, 0]

temperatures = [30, 40, 50, 60]
puts daily_temperatures(temperatures).to_s # [1, 1, 1, 0]

temperatures = [30, 60, 90]
puts daily_temperatures(temperatures).to_s # [1, 1, 0]
