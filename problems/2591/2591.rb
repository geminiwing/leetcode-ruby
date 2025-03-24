# 2591. Distribute Money to Maximum Children - Easy

# The treee rules
# 1. All money must be distributed.
# 2. Everyone must receive at least 1 dollar.
# 3. Nobody receives 4 dollars.
# Return the maximum number of children who may receive exactly 8 dollars.
# Return -1 if it is impossible to distribute the money.

def dist_money(money, children)
  return -1 if money < children

  # Find the maximum possilbe number of children who can get 8 dollars
  c8 = money / 8
  c8 = children if c8 > children  # It cannot exceed the number of children
  m_left = money - 8 * c8         # Money left
  c_left = children - c8          # Children left

  # Because everyone must receive some money, 
  # decrease c8 until we have enough money left for the children left
  while m_left < c_left
    c8 -= 1
    m_left += 8
    c_left += 1
  end

  # Now let's distribute the money left to the children left
  if m_left != 0
    if c_left == 0
      c8 -= 1
    else
      while c8 > 0
        break if distributable?(m_left, c_left)

        c8 -= 1
        m_left = money - 8 * c8
      end
    end
  end

  return c8
end

def distributable?(money, children)
  children == 1 && money == 4 ? false : true
end