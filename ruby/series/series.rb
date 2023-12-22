# frozen_string_literal: true

class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(num)
    raise ArgumentError if num > str.length || num < 1

    str.chars.each_cons(num).map(&:join)
  end
end
