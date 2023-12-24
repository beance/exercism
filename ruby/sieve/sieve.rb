# frozen_string_literal: true

class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    (2..@limit).to_a.select { |n| prime?(n) }
  end

  def prime?(n)
    (2..Math.sqrt(n)).none? { |i| (n % i).zero? }
  end
end
