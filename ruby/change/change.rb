# frozen_string_literal: true

module Change
  class NegativeTargetError < StandardError; end
  class ImpossibleCombinationError < StandardError; end

  def self.generate(coins, change)
    raise(NegativeTargetError) if change.negative?
    return [] if change.zero?

    (1..change).lazy.flat_map do |combination_length|
      coins.repeated_combination(combination_length).select { |combination| combination.sum == change }
    end.first || (raise ImpossibleCombinationError)
  end
end