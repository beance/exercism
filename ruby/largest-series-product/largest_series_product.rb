# frozen_string_literal: true

class Series
  def initialize(input)
    raise ArgumentError unless input.match?(/^\d+$/)

    @str = input
  end

  def largest_product(spam)
    raise ArgumentError if @str.length < spam || spam.negative?

    @str.chars.map(&:to_i).each_cons(spam).map { |x| x.inject(1, :*) }.max
  end
end
