# frozen_string_literal: true

class Crypto
  def initialize(text)
    @text = text
  end

  def ciphertext
    cleaned_text = @text.scan(/\w/).map(&:downcase)
    return '' if cleaned_text.empty?

    column = find_length(cleaned_text.length)
    padded_text = pad_text(cleaned_text, column)
    transposed_text = padded_text.each_slice(column).to_a.transpose

    transposed_text.map { |column| column.join('') }.join(' ')
  end

  def find_length(number)
    column = Math.sqrt(number).ceil
    row = (number.to_f / column).ceil
    return column if row <= column

    row
  end

  def pad_text(text, column)
    text.each_slice(column).map do |slice|
      slice.fill(' ', slice.length, column - slice.length)
    end.flatten
  end
end