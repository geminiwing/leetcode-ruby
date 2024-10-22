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
