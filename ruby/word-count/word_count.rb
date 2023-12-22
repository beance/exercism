# frozen_string_literal: true

class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @phrase.group_by(&:itself).transform_values(&:count)
  end
end
