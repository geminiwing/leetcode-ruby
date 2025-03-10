# 841. Keys and Rooms - Medium

def can_visit_all_rooms(rooms)
  q = [0]
  key_set = Set.new
  key_set << 0
  visited = Array.new(rooms.length, false)

  while room_no = q.shift
    visited[room_no] = true
    keys = rooms[room_no]

    keys.each do |k|
      key_set << k
      q << k if visited[k] == false
    end
  end

  key_set.length == rooms.length
end

# Test

rooms = [[1],[2],[3],[]]
puts can_visit_all_rooms(rooms) # Output: true

rooms = [[1,3],[3,0,1],[2],[0]]
puts can_visit_all_rooms(rooms) # Output: false
