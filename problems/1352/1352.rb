# 1352. Product of the Last K Numbers - Medium
# Design an algorithm that accepts a stream of integers and
# retrieves the product of the last k integers of the stream.

class ProductOfNumbers
  def initialize()
    @p = []
  end

  def add(num)
    if num == 0
      @p = []
    else
      if @p.empty?
        @p << num
      else
        @p << @p.last * num
      end
    end
  end

  def get_product(k)
    if k > @p.length
      0
    elsif k == @p.length
      @p.last
    else
      @p.last / @p[-(k + 1)]
    end
  end
end

# Test

pon = ProductOfNumbers.new()
pon.add(3)
pon.add(0)
pon.add(2)
pon.add(5)
pon.add(4)
puts pon.get_product(2) # 20
puts pon.get_product(3) # 40
puts pon.get_product(4) # 0
pon.add(8)
puts pon.get_product(2) # 32
