require_relative 'ui'

class Game

  attr_accessor :player1, :player2

  def initialize
    @ui = User_Interface.new
    @player1 = nil
    @player2 = nil
  end

  def set_player_symbol
    @choose_sym = @ui.choose_symbol 
    until @choose_sym == "X" || @choose_sym == "O"
      puts "Choose X or O"
      set_player_symbol
      break
    end
    player1_sym
    player2_sym
  end

  def set_computer_symbol
    @choose_sym = @ui.computer_chooses_symbol
    player1_sym
    player2_sym
  end

  def player1_sym
    if @choose_sym == "X" 
      @player1 = @choose_sym
    else
      @player1 = "O"
    end
  end

  def player2_sym
    if @choose_sym == "O"
      @player2 = "X"
    else
      @player2 = "O"
    end
  end

  def start_game
    @ui.game_play
  end

end

a = Game.new
a.start_game
