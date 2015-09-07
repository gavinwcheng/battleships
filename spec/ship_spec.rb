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
end
