# frozen_string_literal: true

module Luhn
  def self.valid?(input)
    input = input.gsub(/\s/, '').tap { |s| return false unless s[/\A\d\d+\z/] }
    (input.chars.reverse.map.with_index do |d, i|
      if i.odd?
        (d.to_i * 2) > 9 ? d.to_i * 2 - 9 : d.to_i * 2
      else
        d.to_i
      end
    end.sum % 10).zero?
  end
end

p Luhn.valid?('4539 3195 0343 6467')
p Luhn.valid?('109')
