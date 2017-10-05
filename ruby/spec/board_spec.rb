require '../board'

describe Board do
  before :each do
    @board = Board.new
  end

  describe "#initialize" do
    it "returns a Board array object" do
      expect {Board.new}.to_not raise_error
    end
  end

  describe "#game_is_over" do
    it "returns true if 3 X's or O's are found in a row" do
      if @board.board[0] == "X" && @board.board[1] == "X" && @board.board[2] == "X"
        @board.board.game_is_over.should == true
      end
    end
  end

  describe "#tie" do
    it "return true if all elements are either X or O" do 
      @board.board.each do |s|
        if s == "X" || s == "O"
          @board.board.tie.should == true
        end
      end
    end
  end

end