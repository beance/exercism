# frozen_string_literal: true

class Proverb
  def initialize(*words, qualifier: nil)
    @words = words
    @last_word = qualifier.nil? ? (@words[0]).to_s : "#{qualifier} #{@words[0]}"
  end

  def to_s
    @words.each_cons(2).map do |i|
      "For want of a #{i[0]} the #{i[1]} was lost.\n"
    end.join + "And all for the want of a #{@last_word}."
  end
end