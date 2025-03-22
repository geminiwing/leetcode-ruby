# 392. Is Subsequence - Easy

def is_subsequence(s, t)
  si = 0
  ti = 0

  return true if s.empty?
  return false if t.empty?

  while 1 do
    if s[si] == t[ti]
      si += 1
      return true if si == s.length
    end
    ti += 1
    return false if ti == t.length
  end
end

# Test

s = "abc"
t = "ahbgdc"
puts is_subsequence(s, t) # Output: true

s = "axc"
t = "ahbgdc"
puts is_subsequence(s, t) # Output: false

s = ""
t = "ahbgdc"
puts is_subsequence(s, t) # Output: true

s = "abc"
t = ""
puts is_subsequence(s, t) # Output: false
