# frozen_string_literal: true

Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      case item.name
      when /Aged Brie/i
        item.quality += item.sell_in < 1 ? 2 : 1
        item.sell_in -= 1
      when /Backstage passes/i
        item.quality += 1
        item.quality -= 1 if item.name =~ /^Conjured/
        item.quality += 1 if item.sell_in <= 10
        item.quality += 1 if item.sell_in <= 5
        item.quality = 0 if item.sell_in < 1
        item.sell_in -= 1
      when /Sulfuras/i
        item.sell_in -= 1 if item.name =~ /^Conjured/
      else
        (item.name =~ /^Conjured/ ? 2 : 1).times do
          item.quality -= item.sell_in < 1 ? 2 : 1
        end
        item.sell_in -= 1
      end
      item.quality = 0 if item.name =~ /^Conjured/ && item.sell_in.negative?
      item.quality = item.quality.clamp(0, 50) unless /Sulfuras/i === item.name
    end
  end
end
