# frozen_string_literal: true

module Year
  def self.leap?(year)
    if (year % 100).zero? && !(year % 400).zero?
      false
    elsif (year % 400).zero?
      true
    elsif (year % 4).zero?
      true
    else
      false
    end
  end
end
