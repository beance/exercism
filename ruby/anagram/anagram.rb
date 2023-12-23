# frozen_string_literal: true

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def anagram?(candidate)
    return false if word == candidate

    word.chars.sort == candidate.chars.sort
  end

  def match(candidates)
    candidates.select { |candidate| Anagram.new(candidate.downcase).anagram?(word) }
  end
end
