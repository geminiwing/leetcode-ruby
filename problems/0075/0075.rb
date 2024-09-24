# 75. Merge Strings Alternately - Easy

def merge_alternately(word1, word2)
  word1_len = word1.length
  word2_len = word2.length
  len = [word1_len, word2_len].max

  result = ''
  (0..len-1).each do |i|
    result << word1[i] if i < word1_len
    result << word2[i] if i < word2_len
  end

  result
end
