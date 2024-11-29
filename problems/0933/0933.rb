# 933. Number of Recent Calls - Easy

class RecentCounter
  TERM = 3000

  def initialize()
    @q = []
  end

  def ping(t)
    @q << t
    while @q[0] < t - TERM
      @q.shift
    end

    return @q.length
  end
end

# test

rc = RecentCounter.new

input = [1, 100, 3001, 3002]
input.each do |i|
  puts rc.ping(i)  # Output: 1, 2, 3, 3
end
