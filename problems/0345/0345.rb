# 345. Reverse Vowels of a String - Easy
# Given a string s, reverse only all the vowels in the string and return it.

VOWELS = %w(a e i o u A E I O U).freeze

def reverse_vowels(s)
  i1 = 0
  i2 = s.length - 1

  while true do
    # find a vowel from the head
    while s[i1] && !VOWELS.include?(s[i1])
      i1 += 1
    end

    # find a vowel from the tail
    while s[i2] && !VOWELS.include?(s[i2])
      i2 -= 1
    end

    break if i1 >= i2

    # swap the vowels
    s[i1], s[i2] = s[i2], s[i1]
    i1 += 1
    i2 -= 1
  end

  s
end

# Alternative solution using a stack
def reverse_vowels(s)
  stack = []

  (0..s.size-1).each do |i|
    stack << s[i] if VOWELS.include?(s[i])
  end

  (0..s.size-1).each do |i|
    s[i] = stack.pop if VOWELS.include?(s[i])
  end

  s
end

# Tests

s = "IceCreAm"
puts reverse_vowels(s) # "AceCreIm"

s = "leetcode"
puts reverse_vowels(s) # "leotcede"

s = 'A'
puts reverse_vowels(s) # "A"

s = 'X'
puts reverse_vowels(s) # "X"

s = '.,'
puts reverse_vowels(s) # ".,"
