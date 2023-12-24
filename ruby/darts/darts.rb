# frozen_string_literal: true

class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    case
    when @x.zero? && @y.zero? then 10
    when Math.sqrt(@x**2 + @y**2) <= 1 then 10
    when Math.sqrt(@x**2 + @y**2) <= 5 then 5
    when Math.sqrt(@x**2 + @y**2) <= 10 then 1
    else 0; end
  end
end
