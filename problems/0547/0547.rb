# 547. Number of Provinces - Medium

def find_circle_num(is_connected)
  size = is_connected.size
  visited = Array.new(size, false)
  count = 0  # district_count

  size.times.each do |row|
    count += 1 if visited[row] == false
    visit_dfs(is_connected, row, visited)
  end

  return count
end

def visit_dfs(is_connected, row, visited)
  visited[row] = true
  size = is_connected.size
  size.times.each do |col|
    if is_connected[row][col] == 1 && visited[col] == false
      visit_dfs(is_connected, col, visited)
    end
  end
end

# Tests

is_connected = [[1,1,0],[1,1,0],[0,0,1]]
puts find_circle_num(is_connected) # 2

is_connected = [[1,0,0],[0,1,0],[0,0,1]]
puts find_circle_num(is_connected) # 3

is_connected = [[1,1,0,0],[1,1,0,1],[0,0,1,0],[0,1,0,1]]
puts find_circle_num(is_connected) # 2
