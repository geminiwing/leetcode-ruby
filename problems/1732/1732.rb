# 1732. Find the Highest Altitude - Easy

def largest_altitude(gain)
  highest = 0
  alt = 0
  for g in gain do
    alt += g
    highest = alt if highest < alt
  end

  highest
end

# test

gain = [-5,1,5,0,-7]
puts largest_altitude(gain)  # Output: 1

gain = [-4,-3,-2,-1,4,3,2]
puts largest_altitude(gain)  # Output: 0
