# frozen_string_literal: true

module ResistorColorDuo
  COLORS = { black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9 }.freeze

  def self.value(colors)
    COLORS[colors[0].to_sym] * 10 + COLORS[colors[1].to_sym]
  end
end
