# frozen_string_literal: true

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    (1...limit).select { |num| @multiples.any? { |multiple| (num % multiple).zero? } }.sum
  end
end