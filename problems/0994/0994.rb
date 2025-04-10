# 994. Rotting Oranges
# 0: an empty cell
# 1: a fresh orange
# 2: a rotten orange
#
# Every turn, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.
# Return the minimum number of turns that must elapse until no cell has a fresh orange. 
# If this is impossible, return -1

def oranges_rotting(grid)
  turn = 0

  while true
    turn += 1
    contage(grid)
    num_rotten = rot(grid)
    break if num_rotten == 0
  end

  any_fresh?(grid) ? -1 : turn - 1
end

def contage(grid)
  rows = grid.size
  cols = grid.first.size

  rows.times do |ri|
    cols.times do |ci|
      if grid[ri][ci] >= 2
        grid[ri][ci-1] += 0.1 if ci-1 >= 0      # upper cell
        grid[ri][ci+1] += 0.1 if ci+1 < cols    # lower cell
        grid[ri-1][ci] += 0.1 if ri-1 >= 0      # left cell
        grid[ri+1][ci] += 0.1 if ri+1 < rows    # right cell
      end
    end
  end
end

def rot(grid)
  rows = grid.size
  cols = grid.first.size
  rotten = 0
  
  rows.times do |ri|
    cols.times do |ci|
      if 1 < grid[ri][ci] && grid[ri][ci] < 2  # rot contaged tomatoes
        grid[ri][ci] = 2
        rotten += 1
      else # reset otherwise
        grid[ri][ci] = grid[ri][ci].floor
      end
    end
  end

  rotten
end

def any_fresh?(grid)
  grid.flatten.any? {|n| n == 1}
end

# Tests

grid = [[2,1,1],[1,1,0],[0,1,1]]
puts oranges_rotting(grid) # 4

grid = [[2,1,1],[0,1,1],[1,0,1]]
puts oranges_rotting(grid) # -1

grid = [[0,2]]
puts oranges_rotting(grid) # 0
