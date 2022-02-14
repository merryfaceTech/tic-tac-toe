require_relative "../tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

  it "shows an empty board in the beginning of the game" do
    result = @tictactoe.turn
    expect(result).to eq(["", "", "", "", "", "", "", "", ""])
  end
end
