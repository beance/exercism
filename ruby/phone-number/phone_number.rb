# frozen_string_literal: false

module PhoneNumber
  def self.clean(number)
    number = number.gsub(/\D/, '').sub(/^1/, '')
    return nil if number.size < 10 || number.size > 11
    return nil if number.size == 11 && !number.start_with?('1')
    return nil if number[3].to_i < 2 || number[0].to_i < 2

    number
  end
end
