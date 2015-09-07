class Board
  attr_reader :ships

  def initialize
    @ships = []
  end

  def place ship, location
    @ships.push ship
    ship.locate location
  end
end
