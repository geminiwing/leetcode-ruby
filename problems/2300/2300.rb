# 2300. Successful Pairs of Spells and Potions

def successful_pairs(spells, potions, success)
  products = spells.map do |s|
    potions.map {|p| p * s }
  end

  result = products.map do |p|
    p.count {|p| p >= success}
  end
end

# Alternative solution using binary search
def successful_pairs(spells, potions, success)
  potions.sort!
  result = []

  spells.each do |s|
    index = potions.bsearch_index{|i| s * i >= success}
    count = index.nil? ? 0 : potions.size - index
    result << count
  end

  result
end

# Tests

spells = [5, 1, 3]
potions = [1, 2, 3, 4, 5]
success = 7
puts successful_pairs(spells, potions, success).to_s # [4, 0, 3]

spells = [3, 1, 2]
potions = [8, 5, 8]
sucess = 16
puts successful_pairs(spells, potions, sucess).to_s # [2, 0, 2]
