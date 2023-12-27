# frozen_string_literal: true

class CustomSet
  attr_accessor :values

  def initialize(values)
    @values = values.sort.uniq
  end

  def empty?
    values.empty?
  end

  def member?(other)
    values.include?(other)
  end

  def subset?(set)
    difference(set).empty?
  end

  def disjoint?(other)
    difference(other) == self
  end

  def ==(other)
    values == other.values
  end

  def add(new_element)
    CustomSet.new(values << new_element)
  end

  def intersection(other)
    CustomSet.new(values & other.values)
  end

  def difference(other)
    CustomSet.new(values - other.values)
  end

  def union(other)
    CustomSet.new(values + other.values)
  end
end
