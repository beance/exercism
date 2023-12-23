# frozen_string_literal: true

module ArmstrongNumbers
  def self.include?(number)
    number == number.digits.map { |digit| digit**number.digits.size }.sum
  end
end
