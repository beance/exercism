# frozen_string_literal: true

class Palindromes
  Palindrome = Struct.new(:value, :factors)
  attr_accessor :largest, :smallest

  def initialize(max_factor: 1, min_factor: 1)
    @factors = [*min_factor..max_factor].repeated_combination(2)
  end

  def generate
    @smallest, @largest = @factors
                          .group_by { |arr| arr.reduce(:*) }
                          .select { |number, _| palindrome?(number) }
                          .minmax
                          .map { |x, y| Palindrome.new(x, y) }
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
