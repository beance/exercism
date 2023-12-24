# frozen_string_literal: true

module PerfectNumber
  def self.classify(number)
    raise RuntimeError unless number.positive?

    sum = (1..number / 2).sum { |n| (number % n).zero? ? n : 0 }
    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end
end

