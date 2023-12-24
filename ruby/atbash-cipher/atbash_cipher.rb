# frozen_string_literal: true

module Atbash
  ALPHABET = ('a'..'z').to_a.join
  ALPHABET_REVERSE = ALPHABET.reverse

  def self.encode(string)
    string.downcase.tr(ALPHABET, ALPHABET_REVERSE).delete(' ,.').scan(/.{1,5}/).join(' ')
  end

  def self.decode(string)
    string.downcase.tr(ALPHABET, ALPHABET_REVERSE).delete(' ,.')
  end
end
