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
