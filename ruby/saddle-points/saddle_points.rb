# frozen_string_literal: true

module Grid
  def self.saddle_points(input)
    reversed = input.transpose
    input.map.with_index do |row, row_index|
      row.map.with_index do |column, column_index|
        if column == row.max && reversed[column_index].min == column
          { 'row' => row_index + 1, 'column' => column_index + 1 }
        end
      end.compact
    end.flatten
  end
end
