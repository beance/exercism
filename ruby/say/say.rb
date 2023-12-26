# frozen_string_literal: true

class Say
  BASIC_NUMBERS = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen
                     sixteen seventeen eighteen nineteen].freeze

  TENS = %w[zero ten twenty thirty forty fifty sixty seventy eighty ninety].freeze
  POWERS = { 1_000_000_000 => 'billion', 1_000_000 => 'million', 1_000 => 'thousand', 100 => 'hundred' }.freeze

  def initialize(number)
    raise ArgumentError if number.negative? || number > 999_999_999_999

    @number = number
  end

  def in_english
    Say.say(@number)
  end

  def self.say(number)
    if number < 20
      BASIC_NUMBERS[number]
    elsif number < 100
      tens = TENS[number / 10]
      (number % 10).zero? ? tens : "#{tens}-#{say(number % 10)}"
    else
      convert(number)
    end
  end

  def self.convert(number)
    power = POWERS.keys.select { |p| p <= number }.max
    name = POWERS[power]
    say_power = "#{say(number / power)} #{name}"
    remainder = number % power
    remainder.zero? ? say_power : "#{say_power} #{say(remainder)}"
  end
end
