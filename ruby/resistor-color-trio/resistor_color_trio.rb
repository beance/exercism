# frozen_string_literal: true

class ResistorColorTrio
  COLORS = { black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9 }.freeze
  attr_reader :colors, :zero

  def initialize(array)
    @colors = array[0..1]
    @zero = array[-1]
  end

  def label
    result = ((COLORS[colors[0].to_sym] * 10 + COLORS[colors[1].to_sym]) * "1#{'0' * COLORS[zero.to_sym]}".to_i)
             .divmod(1000)
    if (result[1]).zero?
      "Resistor value: #{result[0]} kiloohms"
    else
      "Resistor value: #{result[1]} ohms"
    end
  end
end
