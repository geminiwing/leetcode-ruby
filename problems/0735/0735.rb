# 735. Asteroid Collision - Medium

def asteroid_collision(asteroids)
  stack = []

  asteroids.each do |ast|
    if ast > 0  # moving right
      stack << ast
    else        # moving left
      while 1 do
        if stack.empty?
          stack << ast
          break
        elsif stack.last < 0
          stack << ast
          break
        else #stack.last > 0
          if stack.last < -ast
            stack.pop
          elsif stack.last == -ast
            stack.pop
            break
          else
            break
          end
        end
      end
    end
  end

  stack
end

# Tests

asteroids = [5, 10, -5]
puts asteroid_collision(asteroids).to_s  # [5, 10]

asteroids = [8, -8]
puts asteroid_collision(asteroids).to_s  # []

asteroids = [10, 2, -5]
puts asteroid_collision(asteroids).to_s  # [10]

asteroids = [-2, -1, 1, 2]
puts asteroid_collision(asteroids).to_s  # [-2, -1, 1, 2]
