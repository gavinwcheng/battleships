require "ship"

describe Ship do
  it "responds to location" do
    expect(subject).to respond_to :location
  end
end
