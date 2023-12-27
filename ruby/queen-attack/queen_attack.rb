# frozen_string_literal: true

class Queens
  attr_reader :white, :black

  def initialize(white: [0, 0], black: [0, 0])
    @white = white
    @black = black
    if (@white[0]).negative? || @white[0] > 7 || (@white[1]).negative? || @white[1] > 7 || (@black[0]).negative? || @black[0] > 7 || (@black[1]).negative? || @black[1] > 7
      raise ArgumentError
    end
  end

  def attack?
    @white[0] == @black[0] || @white[1] == @black[1] || @white[0] + @white[1] == @black[0] + @black[1] || @white[0] - @white[1] == @black[0] - @black[1]
  end
end
