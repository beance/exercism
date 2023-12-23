# frozen_string_literal: true

class TwelveDays
  DAYS = {
    1 => 'first',    2 => 'second', 3 => 'third', 4 => 'fourth', 5 => 'fifth',
    6 => 'sixth',    7 => 'seventh', 8 => 'eighth',    9 => 'ninth', 10 => 'tenth',
    11 => 'eleventh', 12 => 'twelfth'
  }.freeze
  GIFTS = [
    'a Partridge in a Pear Tree', 'two Turtle Doves', 'three French Hens',
    'four Calling Birds',  'five Gold Rings', 'six Geese-a-Laying',
    'seven Swans-a-Swimming', 'eight Maids-a-Milking', 'nine Ladies Dancing',
    'ten Lords-a-Leaping', 'eleven Pipers Piping', 'twelve Drummers Drumming'
  ].freeze
  def self.song
    DAYS.values.map.with_index do |day, i|
      "On the #{day} day of Christmas my true love gave to me: #{to_series(GIFTS.take(i + 1).reverse)}.\n"
    end.join("\n")
  end

  def self.to_series(items)
    *list, last_item = items
    return last_item if items.one?

    [*list, "and #{last_item}"].join(', ')
  end
end
