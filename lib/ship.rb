class Ship

  DEFAULT_SIZE = 1

  attr_reader :location, :size, :size_range, :direction

  def initialize size = DEFAULT_SIZE
    @size_range = [1, 2, 3, 4, 5]
    fail "Size outside of range!" unless size_range.include?(size)
    @size = size
  end

  def locate location
    @location = location
  end

  def direct direction
    @direction = direction
  end

  def coordinates

    coords = [ location ]
    letters = ["A","B","C","D","E","F","G","H","I","J"]
    numbers = [1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10]
    d = direction[0].downcase

    l = letters.index(location[0])
    n = numbers.index(location[1])

    err_mess = "Ship not on the board"

    while coords.length < size
      if d == 's'
        fail err_mess if n+size > 10
        coords << [letters[l], numbers[n+coords.length]]
      elsif d == 'w'
        fail err_mess if l-size < -1
        coords << [letters[l-coords.length], numbers[n]]
      elsif d == 'n'
        fail err_mess if n-size < -1
        coords << [letters[l], numbers[n-coords.length]]
      elsif d == 'e'
        fail err_mess if l+size > 10
        coords << [letters[l+coords.length], numbers[n]]
      else
        fail "Invalid direction"
      end
    end

    coords

  end

end
