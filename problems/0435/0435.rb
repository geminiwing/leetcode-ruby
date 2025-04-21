# 435. Non overlapping Intervals - Medium
# Return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

def erase_overlap_intervals(intervals)
  # Sort the array by the start time
  intervals.sort!
  count = 0
  last_end = intervals.first[1]

  # Once sorted, run a greedy algorithm
  intervals[1..-1].each do |iterval|         
    if last_end <= iterval[0]               # When not overlapping,
      last_end = iterval[1]                 # take it. (advance the end)
    else                                    # When overlapping,
      last_end = [last_end, iterval[1]].min # take one that ends earlier (retreat the end)
      count += 1                            # and drop the other.
    end
  end

  count
end

# Tests

intervals = [[1,2],[2,3],[3,4],[1,3]]
puts erase_overlap_intervals(intervals) # 1

intervals = [[1,2],[1,2],[1,2]]
puts erase_overlap_intervals(intervals) # 2

intervals = [[1,2],[2,3]]
puts erase_overlap_intervals(intervals) # 0

intervals = [[0,2],[1,3],[2,4],[3,5],[4,6]]
puts erase_overlap_intervals(intervals) # 2
