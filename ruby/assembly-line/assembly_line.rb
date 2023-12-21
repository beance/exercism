# frozen_string_literal: true

class AssemblyLine
  def initialize(speed)
    @speed = speed
    @cars = 221
  end

  def production_rate_per_hour
    if @speed <= 4
      @speed * @cars
    elsif @speed <= 8
      @speed * @cars * 0.9
    elsif @speed == 9
      @speed * @cars * 0.8
    else
      @speed * @cars * 0.77
    end
  end

  def working_items_per_minute
    production_rate_per_hour.round / 60
  end
end
