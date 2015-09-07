require "ship"

describe Ship do
  let(:location) { double(:location) }
  let(:direction) { double(:direction) }

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

  it "responds to direct" do
    expect(subject).to respond_to(:direct).with(1).argument
  end

  it "is pointing at the assigned direction" do
    subject.direct direction
    expect(subject.direction).to eq direction
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
