# 17. Letter Combinations of a Phone Number

KEYPAD = {
  '2' => ['a', 'b', 'c'],
  '3' => ['d', 'e', 'f'],
  '4' => ['g', 'h', 'i'],
  '5' => ['j', 'k', 'l'],
  '6' => ['m', 'n', 'o'],
  '7' => ['p', 'q', 'r', 's'],
  '8' => ['t', 'u', 'v'],
  '9' => ['w', 'x', 'y', 'z'],
}.freeze

def letter_combinations(digits)  # digits is a string of digits 2-9
  return [] if digits == ''

  d = digits[0]
  rest = digits[1..-1]
  chars = KEYPAD[d]
  return chars if digits.length == 1  # terminal condition for recursion

  result = []
  chars.each do |c|
    letter_combinations(rest).each do |str|
      result << c + str
    end
  end

  return result
end

# Tests
digits = '23'
puts letter_combinations(digits).to_s
# => ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]

digits = '2'
puts letter_combinations(digits).to_s
# => ["a", "b", "c"]

digits = ''
puts letter_combinations(digits).to_s
# => []
