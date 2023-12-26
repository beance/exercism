# frozen_string_literal: true

module Diamond
  def self.make_diamond(char)
    chars = ('A'..char).to_a
    return "#{char}\n" if chars.size == 1

    size = chars.size * 2 - 1
    middle = (size / 2.0).ceil - 1
    top = chars.map.with_index do |v, k|
      arr = Array.new(size, ' ')
      if k.zero?
        arr[middle] = v
      else
        arr[middle - k] = v
        arr[middle + k] = v
      end
      "#{arr.join}\n"
    end
    "#{top.join.rstrip}#{top[0..-2].join.reverse}\n"
  end
end