# frozen_string_literal: true

module Pangram
  def self.pangram?(sentence)
    sentence.downcase.scan(/[a-zA-Z]/).sort.uniq.join == ('a'..'z').to_a
  end
end
