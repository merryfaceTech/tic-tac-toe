require_relative "../tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

# Test 1
  it "start new game with an empty board in the beginning of the game" do
    result = @tictactoe.start_new_game
    expect(result).to eq([
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ])
  end

# Test 2
  it "starts a new game and player adds X to top left corner" do
    result = @tictactoe.player_adds_cross(1)
    expect(result).to eq([
      ["X", "", ""],
      ["", "", ""],
      ["", "", ""]
    ])
  end

  # Test 3
  it "starts a new game and player adds naught to top left corner" do
    result = @tictactoe.player_adds_naught(1)
    expect(result).to eq([
      ["O", "", ""],
      ["", "", ""],
      ["", "", ""]
    ])
  end

  # Test 4
  it "Player wins by drawing 3 crosses in top row" do
    @tictactoe.player_adds_cross(1)
    @tictactoe.player_adds_cross(2)
    result = @tictactoe.player_adds_cross(3)
    expect(result).to eq("Game over, Player 1 wins!")
  end

end
