class Ship

  DEFAULT_SIZE = 1

  attr_reader :location, :size, :size_range, :direction

  def initialize size = DEFAULT_SIZE
    @size_range = [1, 2]
    fail "Size outside of range!" unless size_range.include?(size)
    @size = size
  end

  def locate location
    @location = location
  end

  def direct direction
    @direction = direction
  end

end
