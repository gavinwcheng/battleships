
class Game

	attr_reader :boards

	def initialize(num_players, klass = Board.new(2))
		@boards =[]
		num_players.times do
			@boards << klass

			
		end
  end

end

#
#
#
#
#
#
#
#
#
#
#