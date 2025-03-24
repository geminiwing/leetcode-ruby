# 1103. Distribute Candies to People - Easy

def distribute_candies(candies, num_people)
  dist = Array.new(num_people, 0)
  
  num = 1
  while 1
    num_people.times do |i|
      if num < candies
        dist[i] += num
        candies -= num
        num += 1
      else
        dist[i] += candies
        return dist
      end
    end
  end
end

# Tests

candies = 7
num_people = 4
puts distribute_candies(candies, num_people).to_s # => [1, 2, 3, 1]

candies = 10
num_people = 3
puts distribute_candies(candies, num_people).to_s # => [5, 2, 3]
