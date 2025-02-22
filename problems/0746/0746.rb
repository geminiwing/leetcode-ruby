# 746. Min Cost Climbing Stairs - Easy

def min_cost_climbing_stairs(cost)
  len = cost.length
  mem = []

  cost_1 = min_cost(mem, cost, len-1)
  cost_2 = min_cost(mem, cost, len-2)
  [cost_1, cost_2].min
end

def min_cost(mem, cost, i)
  return 0 if i < 0
  return mem[i] if mem[i]

  min_cost_1 = cost[i] + min_cost(mem, cost, i-1)
  min_cost_2 = cost[i] + min_cost(mem, cost, i-2)

  mem[i] = [min_cost_1, min_cost_2].min
end

# Test

cost = [10, 15, 20]
puts min_cost_climbing_stairs(cost) # Output: 15

cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
puts min_cost_climbing_stairs(cost) # Output: 6
