require_relative 'board'

class Game

	attr_reader :boards, :turn

	def initialize(board_size = [5,5])
		@boards = []
		@boards << Board.new
		@boards << Board.new
		@switch = true
		@turn = 1
	end

  def switch_turn
	  @switch = !@switch
	  @switch == true ? @turn = 1 : @turn = 0
		"Next person's go"
	end

	def fire(hit_coords)
    @boards[@turn].receive_fire(hit_coords)
    if @boards[@turn].lost? == false
    	self.switch_turn
    else
    	"you have won!"
    end
  end

end
