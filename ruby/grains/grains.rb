# frozen_string_literal: true

module Grains
  CELLS = 64
  def self.square(n)
    raise ArgumentError if n < 1 || n > CELLS

    2**(n - 1)
  end

  def self.total
    (1..CELLS).sum { |square| square(square) }
  end
end
