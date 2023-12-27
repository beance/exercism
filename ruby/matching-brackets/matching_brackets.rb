# frozen_string_literal: true

module Brackets
  def self.paired?(string)
    stack = []
    pairs = { '(' => ')', '[' => ']', '{' => '}' }
    string.chars.each do |char|
      if pairs.key?(char)
        stack.push(char)
      elsif pairs.value?(char)
        return false if stack.empty? || pairs[stack.pop] != char
      end
    end
    stack.empty?
  end
end
