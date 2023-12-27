# frozen_string_literal: true

class OcrNumbers
  DIGITS = {
    ' _ | ||_|' => '0',
    '     |  |' => '1',
    ' _  _||_ ' => '2',
    ' _  _| _|' => '3',
    '   |_|  |' => '4',
    ' _ |_  _|' => '5',
    ' _ |_ |_|' => '6',
    ' _   |  |' => '7',
    ' _ |_||_|' => '8',
    ' _ |_| _|' => '9'
  }.freeze

  def self.convert(input)
    lines = input.split("\n")
    raise ArgumentError unless (lines.size % 4).zero? && lines.all? { |line| (line.size % 3).zero? }

    lines.each_slice(4).map { |slice| convert_slice(slice) }.join(',')
  end

  def self.convert_slice(slice)
    digits = slice[0..2].map { |line| line.chars.each_slice(3).to_a }
    digits.transpose.map { |digit| recognize_digit(digit) }.join
  end

  def self.recognize_digit(digit)
    DIGITS.fetch(digit.map(&:join).join, '?')
  end
end
