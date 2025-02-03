# 2390. Remove Stars - Medium
def remove_stars(s)
  stack = []
  s.each_char do |c|
    if c == '*'
      stack.pop unless stack.empty?
    else
      stack << c
    end
  end

  result = ""
  for c in stack do
    result << c
  end

  result
end

# Aleternative solution using String instead of Array
def remove_stars(s)
  stack = ""
  s.each_char do |c|
    if c == '*'
      stack.chop! unless stack.empty?
    else
      stack << c
    end
  end

  stack
end

# test

s = "leet**cod*e"
puts remove_stars(s)  # Output: "leetcode"

s = "erase*****"
puts remove_stars(s)  # Output: ""
