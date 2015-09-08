class Board
  attr_reader :ships

  def initialize
    @ships = []
  end

  #make ships

  def place ship, location, direction
    ship.locate location
    ship.direct direction
    ship.coordinates
    ship.on_board
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
