# 1456. Maximum Number of Vowels in a Substring of Given Length - Medium

VOWELS = ['a', 'e', 'i', 'o', 'u'].freeze

def max_vowels(s, k)
  # count vowels in the first k chars.
  top_count = 0
  s[0..k-1].each_char do |c|
    top_count += 1 if VOWELS.include?(c)
  end

  len = s.length
  i1 = 0
  i2 = k-1
  count = top_count

  while (i2 < len-1) do
    i2 += 1
    count += 1 if VOWELS.include?(s[i2])
    count -= 1 if VOWELS.include?(s[i1])
    i1 += 1

    top_count = [top_count, count].max
  end

  top_count
end

# Test

s = "abciiidef"
k = 3
puts max_vowels(s, k) # 3

s = "aeiou"
k = 2
puts max_vowels(s, k) # 2

s = "novowels"
k = 1
puts max_vowels(s, k) # 1
