# frozen_string_literal: true

class Affine
  attr_reader :a, :b

  ALPHABET = ('a'..'z').to_a.join
  def initialize(a, b)
    raise ArgumentError unless a.gcd(ALPHABET.length) == 1

    @a = a
    @b = b
  end

  def encode(string)
    string.downcase.tr(ALPHABET, cipher).delete(' ,.').scan(/.{1,5}/).join(' ')
  end

  def decode(string)
    string.downcase.tr(cipher, ALPHABET).delete(' ,.')
  end

  def cipher
    ALPHABET.chars.map(&method(:encode_char)).join
  end

  def encode_char(c)
    ALPHABET[(a * ALPHABET.index(c) + b) % ALPHABET.length]
  end
end
