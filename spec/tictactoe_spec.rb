require_relative "../tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

  it "start new game with an empty board in the beginning of the game" do
    result = @tictactoe.start_new_game
    expect(result).to eq(["", "", "", "", "", "", "", "", ""])
  end
end
