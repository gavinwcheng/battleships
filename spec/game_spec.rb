require 'game'

describe Game do

	# it "responds to new with number of players argument" do
	# 	expect(described_class).to respond_to(:new).with(10).argument
	# end

	it "expects to create an array of boards that matches number of players" do
		game = Game.new(2,[5,5])
		expect(game.boards.count).to eq 2
	end


	
end