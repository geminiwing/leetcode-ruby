# 1143. Longest Common Subsequence - Medium

def longest_common_subsequence(text1, text2)
  m = text1.size
  n = text2.size
  memo = Array.new(m) { Array.new(n) }  # 2-D array of m*n (m rows * n cols)
  memo.each {|row| row << 0}            # add a zero column
  memo[m] = Array.new(n+1, 0)           # add a zero row

  longest_match(text1, text2, 0, 0, memo)
  memo[0][0]
end

def longest_match(text1, text2, y, x, memo)
  return memo[y][x] unless memo[y][x].nil?

  if text1[y] == text2[x]
    memo[y][x] = 1 + longest_match(text1, text2, y+1, x+1, memo) # max from the lower right diagonal cell
  else
    right_max = longest_match(text1, text2, y, x+1, memo)
    down_max = longest_match(text1, text2, y+1, x, memo)
    memo[y][x] = [right_max, down_max].max
  end
end

# Tests
text1 = "abcde"
text2 = "ace"
puts longest_common_subsequence(text1, text2) # => 3

text1 = "abc"
text2 = "abc"
puts longest_common_subsequence(text1, text2) # => 3

text1 = "abc"
text2 = "def"
puts longest_common_subsequence(text1, text2) # => 0