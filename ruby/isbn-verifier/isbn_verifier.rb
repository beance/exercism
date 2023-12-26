# frozen_string_literal: true

module IsbnVerifier
  def self.valid?(isbn)
    isbn = isbn.gsub('-', '')
    return false unless isbn =~ /^\d{9}[\d|X]$/

    sum = 0
    isbn.chars.map { |char| char == 'X' ? 10 : char.to_i }.each_with_index { |digit, index| sum += digit * (10 - index) }
    (sum % 11).zero?
  end
end
