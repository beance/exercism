# frozen_string_literal: true

module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError unless input_base > 1 && output_base > 1 && digits.reject do |e|
                                 (0...input_base).include? e
                               end.empty?

    number = digits.reduce(0) { |m, e| m * input_base + e }
    result = [number % output_base]
    result.unshift number % output_base while (number /= output_base).positive?
    result
  end
end