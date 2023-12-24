# frozen_string_literal: true

class WordProblem
  attr_reader :digits, :operations

  OPERATORS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied' => :*,
    'divided' => :/
  }.freeze
  def initialize(question)
    @question = question
  end

  def answer
    @digits = @question.scan(/(-?\d+)/).flatten.map(&:to_i)
    @operations = @question.scan(/(plus|minus|multiplied|divided)/).flatten.map { |op| OPERATORS[op] }
    raise ArgumentError if @digits.empty? || @operations.empty?

    equation = @operations.unshift(:+).zip(digits).flatten.compact
    equation.each_slice(2).inject(0) do |sum, (operation, number)|
      sum.send(operation, number)
    end
  end
end
