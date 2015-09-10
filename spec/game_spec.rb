require 'game'

describe Game do

  # let(:board) { double :board }

	# it "responds to new with number of players argument" do
	# 	expect(described_class).to respond_to(:new).with(10).argument
	# end

	it "expects to create an array of boards that matches number of players" do
		game = Game.new
		expect(game.boards.count).to eq 2
	end

	describe "#turn" do
    it "assigns turn to player 1 when switch is true" do
    	game = Game.new
			expect(game.turn).to eq 1
    end
  end

  describe "#switch_turn" do
  	it "switches turn" do
  		game = Game.new
			game.switch_turn
			expect(game.turn).to eq 0
  	end

		it "tells users it is the other person's turn" do
			expect(subject.switch_turn).to eq "Next person's go"
		end
  end
end
