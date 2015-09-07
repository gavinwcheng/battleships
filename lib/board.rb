class Board
  attr_reader :ships

  def initialize
    @ships = []
  end

  def place ship, location, direction
    @ships.push ship
    ship.locate location
    ship.direct direction
  end
end
