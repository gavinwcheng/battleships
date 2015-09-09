require "board"


describe Board do
  let(:ship) { double(:ship, locate: nil, direct: nil, coordinates: [[1,1]], on_board: true) }
  let(:location) { double(:location) }
  let(:direction) { double(:direction) }
  # let(:size) { :size }

  describe "#new" do
    it "responds to new with 1 argument" do
      expect(Board).to respond_to(:new).with(1).argument
    end
  end

  describe "#place" do
    it "responds to place with 3 arguments" do
      expect(subject).to respond_to(:place).with(3).argument
    end

    it "contains the ship after placing" do
      subject.place ship, location, direction
      expect(subject.ships.include? ship).to be true
    end

    it "tells the ship its assigned location" do
      expect(ship).to receive(:locate).with(location)
      subject.place ship, location, direction
    end

    it "tells the ship its assigned direction" do
      expect(ship).to receive(:direct).with(direction)
      subject.place ship, location, direction
    end
  end

  describe "#overlap?" do
    it 'can workout if ships overlap' do
      ship_1 = double(:ship, coords: [[0,0]])
      ship_2 = double(:ship, coords: [[0,0]])
      expect(subject.overlap?(ship_2, ship_1)).to eq(true)
    end
    it 'can workout if ships don\'t overlap' do
      ship_1 = double(:ship, coords: [[0,1]])
      ship_2 = double(:ship, coords: [[0,0]])
      expect(subject.overlap?(ship_2, ship_1)).to eq(false)
    end
  end

  before do
    allow(ship).to receive(:sunk?) {false}
  end

  describe '#receieve_fire' do
    it 'returns hit when ship is hit' do
      allow(ship).to receive(:hit?) {true}
      subject.place ship, location, direction
      expect(subject.receive_fire([1,1])).to eq("hit!")
    end

    it "returns hit and a ship is sunk when a ship is sunk" do
      allow(ship).to receive(:hit?) {true}
      allow(ship).to receive(:sunk?) {true}
      subject.place ship, location, direction
      expect(subject.receive_fire([1,1])).to eq("hit and a ship is sunk!")
    end

    it 'returns miss when ship is missed' do
      allow(ship).to receive(:hit?) {false}
      subject.place ship, location, direction
      expect(subject.receive_fire([1,2])).to eq("miss")
    end

    it 'saves a hit' do
      allow(ship).to receive(:hit?) {true}
      subject.place ship, location, direction
      expect {subject.receive_fire([1,1])}.to change {subject.hits.length}.by(1)
    end

    it 'saves a miss' do
      allow(ship).to receive(:hit?) {false}
      subject.place ship, location, direction
      expect {subject.receive_fire([1,2])}.to change {subject.misses.length}.by(1)
    end

  end
end
