require '../human'
require '../player'
require '../ui'
require '../board'

describe Human do
  before :each do
    @human = Human.new
    @player = Player.new("X")
    @ui = User_Interface.new
    @board = Board.new
  end

  describe "#get_human_spot" do
    it "puts human player's mark on selected spot" do
      if @ui.pick_spot == 1 && @board.board[1] == "X"
        expect(@human.get_human_spot(@board.board, @player)).to_eq true
      end
    end
  end

end