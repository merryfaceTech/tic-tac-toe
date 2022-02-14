require_relative "../tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

  it "start new game with an empty board in the beginning of the game" do
    result = @tictactoe.start_new_game
    expect(result).to eq(["", "", "", "", "", "", "", "", ""])
  end

  it "starts a new game and player adds X to top left corner" do
    result = @tictactoe.player_adds_cross(1)
    expect(result).to eq(["X", "", "", "", "", "", "", "", ""])
  end

  it "starts a new game and player adds naught to top left corner" do
    result = @tictactoe.player_adds_naught(1)
    expect(result).to eq(["O", "", "", "", "", "", "", "", ""])
  end

end
