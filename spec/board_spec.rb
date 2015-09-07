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
end
