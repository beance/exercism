# frozen_string_literal: true

module Blackjack
  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten' then 10
    when 'jack' then 10
    when 'queen' then 10
    when 'king' then 10
    else 0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11
      'low'
    when 12..16
      'mid'
    when 17..20
      'high'
    else
      'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    total = parse_card(card1) + parse_card(card2)
    card_combo = card_range(card1, card2)

    if total > 21
      'P'
    elsif card_combo == 'blackjack'
      parse_dealer = parse_card(dealer_card)
      parse_dealer < 10 ? 'W' : 'S'
    elsif card_combo == 'high' || (card_combo == 'mid' && parse_card(dealer_card) < 7)
      'S'
    else
      'H'
    end
  end
end
