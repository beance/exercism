# frozen_string_literal: true

class School
  def initialize
    @roster = {}
  end

  def add(name, grade)
    @roster[grade] = [] unless @roster[grade]
    if @roster.values.any? { |x| x.include?(name) }
      false
    else
      @roster[grade] << name
      @roster[grade].sort!
      true
    end
  end

  def roster
    @roster.sort.to_h.values.flatten
  end

  def grade(grade)
    @roster[grade].nil? ? [] : @roster[grade]
  end
end