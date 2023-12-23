# frozen_string_literal: true

class SpaceAge
  attr_reader :age

  SECONDS_PER_EARTH_YEAR = 31_557_600.0
  def initialize(seconds)
    @age = seconds / SECONDS_PER_EARTH_YEAR
  end
  { earth: 1.0,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132 }.each do |planet, earth_years|
    define_method("on_#{planet}") do
      @age / earth_years
    end
  end
end
