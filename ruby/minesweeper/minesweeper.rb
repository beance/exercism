# frozen_string_literal: true

module Minesweeper
  def self.annotate(board)
    rows = board.length
    return board if rows.zero?

    cols = board[0].length
    new_board = Array.new(rows) { Array.new(cols, '*') }
    rows.times do |i|
      cols.times do |j|
        next unless board[i][j] == ' '

        count = count_mines(board, i, j)
        new_board[i][j] = count.zero? ? ' ' : count.to_s
      end
    end
    new_board.map(&:join)
  end

  def self.count_mines(board, row, col)
    mine_count = 0
    directions = [-1, 0, 1]
    directions.each do |dx|
      directions.each do |dy|
        next if dx.zero? && dy.zero?

        new_row = row + dx
        new_col = col + dy
        next unless new_row >= 0 && new_row < board.length && new_col >= 0 && new_col < board[0].length

        mine_count += 1 if board[new_row][new_col] == '*'
      end
    end
    mine_count
  end
end
