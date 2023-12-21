# frozen_string_literal: true

class Game
  attr_reader :frames, :current_frame

  class BowlingError < StandardError;  end

  def initialize
    @frames = Array.new(12) { [] }
    @current_frame = 0
  end

  def roll(pins)
    raise BowlingError if pins.negative? || (frames[current_frame].sum + pins > 10) || game_finished?

    frames[current_frame].push(pins)
    @current_frame += 1 if frames[current_frame].length == 2 || pins == 10
  end

  def score
    raise BowlingError unless game_finished?

    frames.flatten.sum + bonuses.sum
  end

  def game_finished?
    final_rolls = frames.slice(9, 3).flatten.length
    if final_rolls != 2
      final_rolls == 3
    else
      frames[9].sum < 10
    end
  end

  def bonuses
    frames.slice(0, 9).map.with_index do |frame, index|
      bonuses = frame[0] / 10 + frame.sum / 10
      frames.slice(index + 1, 2).flatten.slice(0, bonuses).sum
    end
  end
end
