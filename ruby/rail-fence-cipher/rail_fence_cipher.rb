# frozen_string_literal: true

module RailFenceCipher
  def self.decode(sentence, rails)
    zigzag(rails, sentence.length).sort.zip(sentence.chars).sort_by { |a| a[0][1] }.map { |a| a[1] }.join
  end

  def self.encode(plaintext, rails)
    zigzag(rails, plaintext.length).zip(plaintext.chars).sort.map { |a| a[1] }.join
  end

  def self.zigzag(rails, size)
    pattern = (0..rails - 1).to_a + (1..rails - 2).to_a.reverse
    pattern.cycle.first(size).zip(0..size)
  end
end
