class Board
  DEFAULT_BOARD_SIZE = [5,5]

  attr_reader :ships

  def initialize(board_size = DEFAULT_BOARD_SIZE)
    @ships = []
    @board_size = board_size
  end

  #make ships

  def place ship, location, direction
    ship.locate location
    ship.direct direction
    ship.coordinates
    ship.on_board(@board_size)
    @ships.each do |s|
        fail 'Ships overlap' if self.overlap?(ship, s)
    end
    @ships << ship
  end

  def overlap? s1, s2
    s1.coords.each do |a|
        s2.coords.each do |b|
          if b==a
              return true
          end
        end
    end
    false
  end
end
