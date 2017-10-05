require_relative 'ui'
require_relative 'computer'
require_relative 'board'
require_relative 'player'

class ComputervsComputer 

  attr_accessor :mark, :board

  def initialize
    @board = Board.new
    @game = Game.new
    @ui = User_Interface.new
    @computer_player = Computer.new
  end

  def play
    @game.set_computer_symbol
    @ui.display(@board.board)
    @ui.number_range
    until @board.game_is_over || @board.tie
      p1 = Player.new(@game.player1).mark
      p2 = Player.new(@game.player2).mark
      @computer_player.eval_board(@board.board, Player.new(@game.player1).mark)
      @ui.display(@board.board)
      if !@board.game_is_over && !@board.tie
        @computer_player.eval_board(@board.board, Player.new(@game.player2).mark)
      end
      @ui.display(@board.board)
      @board.who_won
    end
    puts "Game over"
    exit
  end

end






