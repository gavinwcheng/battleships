require "player"

describe Player do

  subject { Player.new nil }

  it "reponds to fire with 2 argument" do
    expect(subject).to respond_to(:fire).with(2).argument
  end

  it "responds to take_fire with 1 argument" do
    expect(subject).to respond_to(:take_fire).with(1).argument
  end
end
