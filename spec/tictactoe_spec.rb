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

#   # Test 3
#   it "starts a new game and player adds naught to top left corner" do
#     result = @tictactoe.player_adds_naught(1)
#     expect(result).to eq([
#       ["O", "", ""],
#       ["", "", ""],
#       ["", "", ""]
#     ])
#   end

#   # Test 4
#   it "Player wins by drawing 3 crosses in top row" do
#     @tictactoe.player_adds_cross(1)
#     @tictactoe.player_adds_cross(2)
#     result = @tictactoe.player_adds_cross(3)
#     expect(result).to eq("Game over, Player wins!")
#   end

#   # Test 5
#   it "Player wins by drawing 3 naughts in top row" do
#     @tictactoe.player_adds_naught(1)
#     @tictactoe.player_adds_naught(2)
#     result = @tictactoe.player_adds_naught(3)
#     expect(result).to eq("Game over, AI wins!")
#   end

#   # Test 6
#   it "Both players add to the grid XOX" do
#     @tictactoe.player_adds_cross(1)
#     @tictactoe.player_adds_naught(2)
#     result = @tictactoe.player_adds_cross(3)
#     expect(result).to eq([
#       ["X", "O", "X"],
#       ["", "", ""],
#       ["", "", ""]
#     ])
#   end

#   # Test 7
#   it "starts a new game and player adds X to the middle square" do
#     result = @tictactoe.player_adds_cross(5)
#     expect(result).to eq([
#       ["", "", ""],
#       ["", "X", ""],
#       ["", "", ""]
#     ])
#   end

#   # Test 8
#   it "AI wins by drawing 3 naughts in last row" do
#     @tictactoe.player_adds_naught(7)
#     @tictactoe.player_adds_naught(8)
#     result = @tictactoe.player_adds_naught(9)
#     expect(result).to eq("Game over, AI wins!")
#   end

#   # Test 9
#   it "Player wins by drawing 3 crosses in the left column" do
#     @tictactoe.player_adds_cross(1)
#     @tictactoe.player_adds_cross(4)
#     result = @tictactoe.player_adds_cross(7)
#     expect(result).to eq("Game over, Player wins!")
#   end

end
