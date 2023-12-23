# frozen_string_literal: true

module Transpose
  def self.transpose(input)
    lines = input.gsub(' ', '*').split("\n")
    longest_line_length = lines.map(&:length).max
    lines.map do |line|
      line.ljust(longest_line_length)
    end.map(&:chars).transpose.map(&:join).map(&:rstrip).join("\n").gsub('*', ' ')
  end
end
