# frozen_string_literal: true

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump'].freeze

  def initialize(number)
    @number = number.to_i
    [] unless (1..31).cover?(@number)
  end

  def commands
    handshake = []
    binary_sequence = @number.to_s(2).reverse
    binary_sequence[0, 4].each_char.with_index { |char, idx| handshake << COMMANDS[idx] if char == '1' }
    handshake.reverse! if binary_sequence[4] == '1'
    handshake
  end
end
