require_relative 'comvshum'
require_relative 'humvshum'
require_relative 'comvscom'

class User_Interface


  def intro
    puts "Welcome to Tic Tac Toe"
    puts "Choose your game play. Press corresponding number"
    puts "1) Human vs. Human"
    puts "2) Computer vs. Computer"
    puts "3) Computer vs. Human"
  end

  def game_play
    intro
    game_play_num = gets.chomp.to_i
    while game_play_num > 3 || game_play_num < 1
      puts "Please enter 1, 2, or 3"
      game_play
    end

    while game_play_num < 3 || game_play_num > 1
      if game_play_num == 1 
        game = HumanvsHuman.new
        game.play
      elsif game_play_num == 2
        game = ComputervsComputer.new
        game.play
      else
        if game_play_num == 3
          computer_vs_human_game
        end
      end
    end
  end

  def computer_vs_human_game
    game = ComputervsHuman.new
    first = who_goes_first
    if first == "M"
      game.human_plays_first
    else
      game.computer_plays_first
    end
  end

  def display(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n===+===+===\n #{board[3]} | #{board[4]} | #{board[5]} \n===+===+===\n #{board[6]} | #{board[7]} | #{board[8]} \n      "
  end

  def pick_spot
    spot = gets.chomp.to_i
  end

  def choose_symbol
    puts "Choose your symbol. X or O"
    symbol = gets.chomp.upcase
  end

  def computer_chooses_symbol
    puts "Choose your symbol. X or O"
    choose_random_mark = ["X", "O"].sample
    symbol = choose_random_mark
  end

  def number_range
    puts "Enter a number between 0 - 8"
  end

  def who_goes_first
    puts "Who would like to go first? Type M for me or O for the other player"
    answer = gets.chomp.upcase
  end

end