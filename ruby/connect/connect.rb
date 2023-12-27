# frozen_string_literal: true

class Board
  def initialize(board)
    @game = board.map { |row| row.split(' ') }
    @o_set = find_indexes(@game, 'O')
    @x_set = find_indexes(@game.transpose, 'X')
  end

  def winner
    return 'X' if winner?(@x_set)
    return 'O' if winner?(@o_set)

    ''
  end

  private

  def find_indexes(board, player)
    board.map { |row| row.map.with_index { |c, i| i if c == player }.compact }
  end

  def winner?(board)
    board.first.any? { |start| check_paths(board, 0, start) }
  end

  def check_paths(board, row, col, path = [])
    return true if row == board.length - 1

    next_move = valid_moves(row, col).find do |next_row, next_col|
      board[next_row].member?(next_col) && !path.member?([next_row, next_col])
    end
    next_move.nil? ? false : check_paths(board, *next_move, path << next_move)
  end

  def valid_moves(row, col)
    [[row + 1, col], [row + 1, col - 1], [row, col + 1], [row, col - 1],
     [row - 1, col], [row - 1, col + 1]]
  end
end
