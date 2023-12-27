# frozen_string_literal: true

class Triangle

  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    return [] if @num_rows <= 0

    triangle = [[1]]

    (1...@num_rows).each do |row_index|
      previous_row = triangle[row_index - 1]
      current_row = [1]

      (1...row_index).each do |col_index|
        current_row << previous_row[col_index - 1] + previous_row[col_index]
      end

      current_row << 1
      triangle << current_row
    end

    triangle
  end
end
