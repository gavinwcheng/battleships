require "ship"

describe Ship do
  let(:location) { double(:location) }

  it "responds to location" do
    expect(subject).to respond_to :location
  end

  it "responds to locate" do
    expect(subject).to respond_to(:locate).with(1).argument
  end

  it "is located at the assigned location" do
    subject.locate location
    expect(subject.location).to eq location
  end

  describe '#new' do

    it 'accepts size as a parameter' do
      expect{ Ship.new(double :size) }.to_not raise_error if subject.size_range.include?(double :size)
    end

    it 'raises an error if size is not in the range given' do
      expect{ Ship.new(double :size) }.to raise_error "Size outside of range!" unless subject.size_range.include?(double :size)
    end

  end

end
