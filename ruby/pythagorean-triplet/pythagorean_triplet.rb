# frozen_string_literal: true

module PythagoreanTriplet
  def self.triplets_with_sum(n)
    (1...n).each_with_object([]) do |a, res|
      b = (n * (2 * a - n)) / (2 * (a - n)).to_f
      res << [a, b, n - a - b] if (b % 1).zero? && a < b
    end
  end
end
