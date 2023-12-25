# frozen_string_literal: true

module BookStore
  DISCOUNT = {
    1 => 1.0,
    2 => 0.95,
    3 => 0.9,
    4 => 0.8,
    5 => 0.75
  }.freeze
  BASE = 8.00

  def self.calculate_price(basket)
    sets = []
    until basket.empty?
      u = basket.uniq
      sets << u.length
      u.map { |book| basket.slice!(basket.index(book)) }
    end

    while sets.include?(3) && sets.include?(5)
      sets[sets.index(3)] = 4
      sets[sets.index(5)] = 4
    end
    sets.sum { |set| set * BASE * DISCOUNT[set] }
  end
end
