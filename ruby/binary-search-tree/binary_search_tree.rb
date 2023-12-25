# frozen_string_literal: true

class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(data)
    if data <= @data
      @left ? @left&.insert(data) : @left = Bst.new(data)
    else
      @right ? @right&.insert(data) : @right = Bst.new(data)
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left&.each(&block)
    yield(data)
    right&.each(&block)
  end
end
