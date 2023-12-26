# frozen_string_literal: true

class Bucket
  attr_reader :size, :name
  attr_accessor :litres

  def initialize(name, size)
    @name = name
    @size = size
    @litres = 0
  end

  def room
    @size - @litres
  end

  def fill
    @litres = @size
  end

  def empty
    @litres = 0
  end

  def full?
    @litres == @size
  end

  def empty?
    @litres.zero?
  end

  def pour_into(other)
    amount = [@litres, other.room].min
    @litres -= amount
    other.litres += amount
  end
end

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_one, bucket_two, goal, start_bucket)
    start = start_bucket == 'one' ? Bucket.new('one', bucket_one) : Bucket.new('two', bucket_two)
    other = start_bucket == 'two' ? Bucket.new('one', bucket_one) : Bucket.new('two', bucket_two)
    @moves = 0

    if other.size == goal
      @goal_bucket = other.name
      @other_bucket = start.size
      @moves = start_bucket == 'one' ? 2 : 1
      return
    end

    until [start.litres, other.litres].include?(goal)
      if start.empty?
        start.fill
      elsif other.full?
        other.empty
      else
        start.pour_into(other)
      end
      @moves += 1
    end

    if start.litres == goal
      @goal_bucket = start.name
      @other_bucket = other.litres
    else
      @goal_bucket = other.name
      @other_bucket = start.litres
    end
  end
end
