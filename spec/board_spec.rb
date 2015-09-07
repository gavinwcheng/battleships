require "board"


describe Board do
  let(:ship) { double(:ship, locate: nil) }
  let(:location) { double(:location) }

  describe "#place" do
    it "responds to place with 2 arguments" do
      expect(subject).to respond_to(:place).with(2).argument
    end

    it "contains the ship after placing" do
      subject.place ship, location
      expect(subject.ships.include? ship).to be true
    end

    it "tells the ship its assigned location" do
      expect(ship).to receive(:locate).with(location)
      subject.place ship, location
    end
  end
end
