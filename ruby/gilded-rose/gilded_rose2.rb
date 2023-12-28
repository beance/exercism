Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      if item.sell_in.positive?
        case item.name
        when /Aged Brie$/
          item.quality += 1
        when 'Backstage passes to a TAFKAL80ETC concert'
          item.quality += 1
          item.quality += 1 if item.sell_in <= 10
          item.quality += 1 if item.sell_in <= 5
        when 'Conjured backstage passes to a TAFKAL80ETC concert'
          item.quality += 1 if item.sell_in <= 10
          item.quality += 1 if item.sell_in <= 5
        when /^Conjured/
          item.quality -= 2
        else
          item.quality -= 1
        end
      else
        case item.name
        when 'Aged Brie'
          item.quality += 2
        when 'Backstage passes to a TAFKAL80ETC concert'
          item.quality = 0
        when /^Conjured/
          item.quality = 0
        else
          item.quality -= 2
        end
      end

      case item.name
      when 'Sulfuras, Hand of Ragnaros'
        item.quality = 80
      when 'Conjured Sulfuras, Hand of Ragnaros'
        item.quality = item.sell_in.positive? ? 80 : 0
        item.sell_in -= 1
      else
        item.quality = [item.quality, 0].max
        item.quality = [item.quality, 50].min
        item.sell_in -= 1
      end
    end
  end
end