require_relative 'ui'
require_relative 'human'
require_relative 'computer'
require_relative 'board'
require_relative 'player'

class HumanvsHuman 

  attr_accessor :mark, :board, :player1, :player2

  def initialize
    @board = Board.new
    @game = Game.new
    @ui = User_Interface.new
    @human_player = Human.new
  end

  def play
    @ui.who_goes_first
    @game.set_player_symbol
    @ui.display(@board.board)
    @ui.number_range
    until @board.game_is_over || @board.tie
      p1 = Player.new(@game.player1).mark
      p2 = Player.new(@game.player2).mark
      puts "Your turn #{p1}"
      @human_player.get_human_spot(@board.board, Player.new(@game.player1).mark)
      @ui.display(@board.board)
      if !@board.game_is_over && !@board.tie
        puts "Your turn #{p2}"
        @human_player.get_human_spot(@board.board, Player.new(@game.player2).mark)
      end
      @ui.display(@board.board)
      @board.who_won
    end
    puts "Game over"
    exit
  end

end