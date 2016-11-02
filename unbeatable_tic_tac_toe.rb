class Game
  def initialize
    @human = nil
    @computer = nil
  end

  def choose_mark
    array = []
    puts "Choose X or O"
    mark = gets.chomp 
    puts "Choose space"
    if mark == "X"
      @human = mark
    else
      @human = "O"
    end

    if mark == "O"
      @computer = "X"
    else
      @computer = "O"
    end

    array << mark
    array.join
  end

  def move
    choose_mark
    index = gets.chomp.to_i
    Board.new.choose_spot(@human,index)
  end
end

class Board
  def initialize
    @board = ["","","","","","","","",""]
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def choose_spot(player,index)
    @board[index] = player
    display
  end

  def status
    @board[2].nil?
  end

  def winner
    winner_array = []
    if @board[0] == @board[1] && @board[1] == @board[2] && @board[0] != ""
      puts "#{@board[0]} You won!" 
      winner_array << @board[0]
      exit
    elsif @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != ""
      puts "#{@board[3]} You won!" 
      winner_array << @board[3]
      exit
    elsif @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != ""
      puts "#{@board[6]} You won!"
      winner_array << @board[6]
      exit
    elsif @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != ""
      puts "#{@board[0]} You won!"
      winner_array << @board[0]
      exit
    elsif @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != ""
      puts "#{@board[1]} You won!"
      winner_array << @board[1]
      exit
    elsif @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != ""
      puts "#{@board[2]} You won!"
      winner_array << @board[2]
      exit
    elsif @board[0] == @board[4] && @board[4] == @board[8] && @board[0] != ""
      puts "#{@board[0]} You won!"
      winner_array << @board[0]
      exit
    else
      if @board[2] == @board[4] && @board[4] == @board[6] && @board[2] != ""
        puts "#{@board[2]} You won!"
        winner_array << @board[2]
        exit
      end
    end
    winner_array.join
  end

  def tie
    @board.length > 9
  end

  def game_over
    tie || winner
  end

  def available_spaces
    array = []
    @board.each_with_index do |space,index|
      if space == ""
        array << index
      end
    end
    array
  end

end

class Minimax
  def testing
    Game.new.move
    Board.new.status
  end

  def score(board, player, opponent)
    if board.winner == player
      return 1
    elsif board.winner == opponent
      return -1
    else
      return 0
    end
  end

   def switch(piece)
    piece == 'X' ? 'O' : 'X'
   end

  def minimax(board, player, opponent)
    return score(board, player, opponent) if game_over(board)

    scores = {}

    board.available_spaces.each do |space|
      copy_board = board.dup

      copy_board[space] = player
      scores[space] = minmax(copy_board, switch(player))
    end
  end
  best_move = scores.max_by { |key, value| value }[0]
  best_move
end

b = Minimax.new
b.testing

#b = Game.new
#b.move










