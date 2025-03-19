# 0649. Dota2 Senate - Medium

def predict_party_victory(senate)
  count = {'R' => senate.count('R'), 'D' => senate.count('D')}
  kills = {'R' => 0, 'D' => 0}
  party_name = {'R' => 'Radiant', 'D' => 'Dire'}
  q = senate.chars  # converts string into array

  while !q.empty?
    me = q.shift
    opponent = (me == 'R') ? 'D' : 'R'
    
    if kills[me] > 0
      kills[me] -= 1
      count[me] -= 1
    else
      return party_name[me] if count[opponent] == 0

      kills[opponent] += 1
      q << me
    end
  end
end

# Tests

senate = "RD"
puts predict_party_victory(senate) # "Radiant"

senate = "RDD"
puts predict_party_victory(senate) # "Dire"

senate = "RDDDR"
puts predict_party_victory(senate) # "Dire"
