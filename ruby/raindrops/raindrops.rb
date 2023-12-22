# frozen_string_literal: true

module Raindrops
  RAINDROPS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze
  def self.convert(num)
    result = RAINDROPS.select { |k, _v| (num % k).zero? }
    result.empty? ? num.to_s : result.values.join
  end
end
