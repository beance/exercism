# frozen_string_literal: true

class Cipher
  attr_reader :key

  ALPHABET = ('a'..'z').to_a.join
  def initialize(key = nil)
    @key = key || Array.new(100) { ALPHABET[rand(ALPHABET.length)] }.join
    raise ArgumentError if @key.empty? || @key =~ /[^a-z]/
  end

  def encode(text)
    text.chars.zip(key.chars).map do |text_char, key_char|
      position = ALPHABET.index(text_char) + ALPHABET.index(key_char)
      ALPHABET[position % ALPHABET.length]
    end.join
  end

  def decode(text)
    text.chars.zip(key.chars).map do |text_char, key_char|
      position = ALPHABET.index(text_char) - ALPHABET.index(key_char)
      ALPHABET[position % ALPHABET.length]
    end.join
  end
end
