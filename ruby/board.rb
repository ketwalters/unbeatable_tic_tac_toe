class Board

  attr_accessor :board

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def game_is_over
    [@board[0], @board[1], @board[2]].uniq.length == 1 ||
    [@board[3], @board[4], @board[5]].uniq.length == 1 ||
    [@board[6], @board[7], @board[8]].uniq.length == 1 ||
    [@board[0], @board[3], @board[6]].uniq.length == 1 ||
    [@board[1], @board[4], @board[7]].uniq.length == 1 ||
    [@board[2], @board[5], @board[8]].uniq.length == 1 ||
    [@board[0], @board[4], @board[8]].uniq.length == 1 ||
    [@board[2], @board[4], @board[6]].uniq.length == 1
  end

  def who_won
    if [@board[0], @board[1], @board[2]].uniq.join == "X" || [@board[0], @board[1], @board[2]].uniq.join == "O"
      puts "#{@board[0]} you win!"
    elsif [@board[3], @board[4], @board[5]].uniq.join == "X" || [@board[3], @board[4], @board[5]].uniq.join == "O"
      puts "#{@board[3]} you win!"
    elsif [@board[6], @board[7], @board[8]].uniq.join == "X" || [@board[6], @board[7], @board[8]].uniq.join == "O"
      puts "#{@board[6]} you win!"
    elsif [@board[0], @board[3], @board[6]].uniq.join == "X" || [@board[0], @board[3], @board[6]].uniq.join == "O"
      puts "#{@board[0]} you win!"
    elsif [@board[1], @board[4], @board[7]].uniq.join == "X" || [@board[1], @board[4], @board[7]].uniq.join == "O"
      puts "#{@board[1]} you win!"
    elsif [@board[2], @board[5], @board[8]].uniq.join == "X" || [@board[2], @board[5], @board[8]].uniq.join == "O"
      puts "#{@board[2]} you win!"
    elsif [@board[0], @board[4], @board[8]].uniq.join == "X" || [@board[0], @board[4], @board[8]].uniq.join == "O"
      puts "#{@board[0]} you win!"
    elsif [@board[2], @board[4], @board[6]].uniq.join == "X" || [@board[2], @board[4], @board[6]].uniq.join == "O"
      puts "#{@board[2]} you win!"
    end
  end

  def tie
    @board.all? { |s| s == "X" || s == "O" }
  end

end
