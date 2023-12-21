# frozen_string_literal: true

module Acronym
  def self.abbreviate(name)
    name.scan(/\b\w/).join.upcase
  end
end
