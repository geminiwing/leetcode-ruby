# 1926. Nearest Exit from Entrance in Maze - Medium
# Marking visited cells when enqueuing (rather than dequeuing) improves performance
# because it avoids enqueuing the same cell multiple times.

class ExitFinder
  attr_accessor :maze, :m, :n, :q, :start_y, :start_x

  def initialize(maze, entrance)
    @maze = maze
    @start_y, @start_x = entrance[0], entrance[1]  # starting positon
    @m, @n = maze.size, maze[0].size               # maze dimensions
    @q = []                                        # queue for BFS
  end

  def find
    maze[start_y][start_x] = '+'   # mark as visited
    enqueue_possible_moves(start_y, start_x, 1)

    while !q.empty?
      y, x, count = q.shift
      # maze[y][x] = '+'  # to mark as visited when dequeeing
      return count if exit?(y, x)

      enqueue_possible_moves(y, x, count+1)
    end

    return -1
  end

  private

  def exit?(y, x)
    y == 0 || y == m-1 || x == 0 || x == n-1
  end

  def enqueue_possible_moves(y, x, count)
    enqueue(y-1, x, count) if y-1 >= 0   && maze[y-1][x] == '.'  # up
    enqueue(y+1, x, count) if y+1 <= m-1 && maze[y+1][x] == '.'  # down
    enqueue(y, x-1, count) if x-1 >= 0   && maze[y][x-1] == '.'  # left
    enqueue(y, x+1, count) if x+1 <= n-1 && maze[y][x+1] == '.'  # right
  end

  def enqueue(y, x, count)
    q << [y, x, count]
    maze[y][x] = '+'  # to mark as visited when enqueuing
  end
end

def nearest_exit(maze, entrance)
  finder = ExitFinder.new(maze, entrance)
  finder.find
end

# Test

maze = [["+","+",".","+"],[".",".",".","+"],["+","+","+","."]]
entrance = [1,2]
puts nearest_exit(maze, entrance)  # 1

maze = [["+","+","+"],[".",".","."],["+","+","+"]]
entrance = [1,0]
puts nearest_exit(maze, entrance)  # 2

maze = [[".","+"]]
entrance = [0,0]
puts nearest_exit(maze, entrance)  # -1
