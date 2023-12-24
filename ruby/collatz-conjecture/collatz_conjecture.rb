# frozen_string_literal: true

module CollatzConjecture
  def self.steps(number)
    raise ArgumentError if number < 1

    count = 0
    while number != 1
      number.even? ? number /= 2 : number = 3 * number + 1
      count += 1
    end
    count
  end
end
