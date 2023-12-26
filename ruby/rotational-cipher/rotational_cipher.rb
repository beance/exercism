# frozen_string_literal: true

class RotationalCipher
  LOWER = ('a'..'z').to_a.freeze
  UPPER = ('A'..'Z').to_a.freeze
  def self.rotate(input, key)
    input.tr('a-zA-Z', (LOWER.rotate(key) + UPPER.rotate(key)).join)
  end
end
