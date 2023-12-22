# frozen_string_literal: true

module Isogram
  def self.isogram?(phrase)
    letters = phrase.downcase.scan(/\w/)
    letters == letters.uniq
  end
end
