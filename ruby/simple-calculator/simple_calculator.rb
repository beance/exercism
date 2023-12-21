# frozen_string_literal: true

class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    begin
      "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end
end
