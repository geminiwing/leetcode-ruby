# 1207. Unique Number of Occurrences - Easy

def unique_occurrences(arr)
  occ = {}
  arr.each do |n|
    occ[n] = occ[n].to_i + 1
  end

  values = occ.values
  uniq_values = values.uniq
  values.size == uniq_values.size
end

# Tests

arr = [1,2,2,1,1,3]
puts unique_occurrences(arr) # true

arr = [1, 2]
puts unique_occurrences(arr) # false

arr = [-3,0,1,-3,1,1,1,-3,10,0]
puts unique_occurrences(arr) # true
