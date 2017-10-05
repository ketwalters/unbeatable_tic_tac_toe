require '../player'

describe Player do
  before :each do
    @player = Player.new("X")
  end

  describe "#initialize" do
    it "takes one parameter and returns a Player object" do
      expect {Player.new}.to_not raise_error
    end
  end

end