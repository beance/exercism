# frozen_string_literal: true

module RunLengthEncoding
  def self.encode(input)
    input.chars.chunk(&:itself).map { |k, v| [v.length, k] }.map { |k, v| k > 1 ? "#{k}#{v}" : v.to_s }.join
  end

  def self.decode(input)
    input.scan(/(\d*)(\D)/).map { |count, chr| count.empty? ? chr : chr * count.to_i }.join
  end
end
