# frozen_string_literal: true

class Robot
  BEARINGS = %i[north east south west].freeze
  TURN_RIGHT = BEARINGS.zip(BEARINGS.rotate(1)).to_h.freeze
  TURN_LEFT = BEARINGS.zip(BEARINGS.rotate(-1)).to_h.freeze
  ADVANCE = BEARINGS.zip([[0, 1], [1, 0], [0, -1], [-1, 0]]).to_h.freeze
  attr_reader :bearing, :coordinates

  def initialize(bearing: :north, coordinates: [0, 0])
    @bearing = bearing
    @coordinates = coordinates
  end

  def orient(direction)
    raise ArgumentError unless BEARINGS.include?(direction)

    @bearing = direction
  end

  def turn_right
    @bearing = TURN_RIGHT[@bearing]
  end

  def turn_left
    @bearing = TURN_LEFT[@bearing]
  end

  def at(*coordinates)
    @coordinates = coordinates.first(2)
  end

  def advance
    @coordinates = @coordinates.zip(ADVANCE[@bearing]).map(&:sum)
  end
end

class Simulator
  INSTRUCTIONS = { 'R' => :turn_right, 'L' => :turn_left, 'A' => :advance }.freeze
  def instructions(instructions)
    instructions.chars.map(&INSTRUCTIONS.method(:[]))
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instructions)
    instructions(instructions).each(&robot.method(:send))
  end
end
