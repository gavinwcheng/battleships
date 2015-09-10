require_relative 'board'

class Game

	attr_reader :boards, :turn

	def initialize(board_size = [5,5])
		@boards = []
		@boards << Board.new
		@boards << Board.new
		@switch = true
	end

  def turn
	  @switch == true ? @turn = 1 : @turn = 0
	end

  def switch_turn
	  @switch = !@switch
		"Next person's go"
	end
end
