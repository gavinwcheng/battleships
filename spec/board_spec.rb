require "board"


describe Board do
  let(:ship) { double(:ship, locate: nil, direct: nil) }
  let(:location) { double(:location) }
  let(:direction) { double(:direction) }
  # let(:size) { :size }

  describe "#place" do
    it "responds to place with 3 arguments" do
      expect(subject).to respond_to(:place).with(3).argument
    end

    xit "contains the ship after placing" do
      subject.place ship, location, direction
      expect(subject.ships.include? ship).to be true
    end

    xit "tells the ship its assigned location" do
      expect(ship).to receive(:locate).with(location)
      subject.place ship, location, direction
    end

    xit "tells the ship its assigned direction" do
      expect(ship).to receive(:direct).with(direction)
      subject.place ship, location, direction
    end
  end

  describe "overlap?" do
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
end
