# frozen_string_literal: true

module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    strand1.chars.zip(strand2.chars).count { |a, b| a != b }
  end
end
