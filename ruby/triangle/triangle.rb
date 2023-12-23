# frozen_string_literal: true

class Triangle
  attr_reader :sides, :unique_sides

  def initialize(sides_array)
    @sides = sides_array.sort
    @unique_sides = sides.uniq.size
  end

  def equilateral?
    triangle? && unique_sides == 1
  end

  def isosceles?
    triangle? && unique_sides == 2 || equilateral?
  end

  def scalene?
    triangle? && unique_sides == 3
  end

  def triangle?
    sides.all?(&:positive?) && sides[0] + sides[1] >= sides[2]
  end
end
