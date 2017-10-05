require_relative 'ui'

class Human

  def get_human_spot(board, mark)
    spot = User_Interface.new.pick_spot
    if spot.between?(0,8) && board[spot] != "X" && board[spot] != "O"
      board[spot] = mark
    else 
      if spot < 0 || spot > 8 
        puts "Invalid number. Please choose a number from 0 - 8"
        get_human_spot(board,mark)
      end
    end
  end
    

end