require_relative 'player'

class Computer

  attr_accessor :board, :player1, :player2, :mark

  def initialize
    @board = Board.new
    @game = Game.new
  end

  def eval_board(board, mark)
    spot = nil
    until spot
      if board[4] == "4"
        spot = 4
        board[spot] = mark
      else
        spot = get_best_move(board, mark)
        if board[spot] != "X" && board[spot] != "O"
          board[spot] = mark
        else
          spot = nil
        end
      end
    end
  end

  def mark_board_at_index(board, index, player)
    board[index.to_i] = player
  end

  def reset_space_at(board, space)
    board[space.to_i] = space
  end

  def tie(board)
    board.all? { |s| s == "X" || s == "O" }
  end

  def game_is_over(board)
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def swap(player)
    player == 'X' ? 'O' : 'X'
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    return -1 if game_is_over(board)
    return 0 if tie(board)

    available_spaces = []

    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end

    available_spaces.each do |space|
      mark_board_at_index(board, space, next_player)
      best_score[space] = -1 * get_best_move(board, swap(next_player), depth + 1, {})
      reset_space_at(board, space)
    end

    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]

    if depth == 0
      return best_move.to_i
    elsif depth > 0
      return highest_minimax_score.to_i
    end
  end

end
