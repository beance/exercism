# frozen_string_literal: true

class Matrix
  def initialize(string)
    @rows = string.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def row(row)
    @rows[row - 1]
  end

  def column(column)
    @rows.transpose[column - 1]
  end
end
