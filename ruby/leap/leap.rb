# frozen_string_literal: true

module Year
  def self.leap?(year)
    (year % 4).zero? && (year % 100 != 0 || (year % 400).zero?)
  end
end
