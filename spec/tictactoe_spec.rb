require_relative "../utils/tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

  player_wins = "Game over, Player wins!"
  ai_wins = "Game over, AI wins!"

# Test 1
  it "start new game with an empty board in the beginning of the game" do
    result = @tictactoe.start_new_game
    expect(result).to eq([
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ])
  end

# Test 2
  it "starts a new game and player adds X to top left corner" do
    result = @tictactoe.play_hand(1, "X")
    expect(result).to eq("X  |   |   " + "\n \n" + "It's the AI's turn.")
  end

  # Test 3
  it "starts a new game and ai adds naught to top left corner" do
    result = @tictactoe.play_hand(1, "O")
    expect(result).to eq("O  |   |   " + "\n \n" + "It's your turn.")
  end

  # Test 4
  it "Player wins by drawing 3 crosses in top row" do
    @tictactoe.play_hand(1, "X")
    @tictactoe.play_hand(2, "X")
    result = @tictactoe.play_hand(3, "X")
    expect(result).to eq(player_wins)
  end

  # Test 5
  it "AI wins by drawing 3 naughts in top row" do
    @tictactoe.play_hand(1, "O")
    @tictactoe.play_hand(2, "O")
    result = @tictactoe.play_hand(3, "O")
    expect(result).to eq(ai_wins)
  end

  # Test 6
  it "Both players add to the grid XOX" do
    @tictactoe.play_hand(1, "X")
    @tictactoe.play_hand(2, "O")
    result = @tictactoe.play_hand(3, "X")
    expect(result).to eq("XOX|   |   " + "\n \n" + "It's the AI's turn.")
  end

  # Test 7
  it "starts a new game and player adds X to the middle square" do
    result = @tictactoe.play_hand(5, "X")
    expect(result).to eq("   | X |   " + "\n \n" + "It's the AI's turn.")
  end

  # Test 8
  it "AI wins by drawing 3 naughts in last row" do
    @tictactoe.play_hand(7, "O")
    @tictactoe.play_hand(8, "O")
    result = @tictactoe.play_hand(9, "O")
    expect(result).to eq(ai_wins)
  end

  # Test 9
  it "Player wins by drawing 3 crosses in the left column" do
    @tictactoe.play_hand(1, "X")
    @tictactoe.play_hand(4, "X")
    result = @tictactoe.play_hand(7, "X")
    expect(result).to eq(player_wins)
  end

    # Test 10
    it "AI wins by drawing 3 naughts in the middle column" do
      @tictactoe.play_hand(2, "O")
      @tictactoe.play_hand(5, "O")
      result = @tictactoe.play_hand(8, "O")
      expect(result).to eq(ai_wins)
    end

    # Test 11
    it "AI wins by drawing 3 naughts in the last column" do
      @tictactoe.play_hand(3, "O")
      @tictactoe.play_hand(6, "O")
      result = @tictactoe.play_hand(9, "O")
      expect(result).to eq(ai_wins)
    end

    # Test 12
    it "AI wins by drawing 3 naughts left-to-right diagonally" do
      @tictactoe.play_hand(1, "O")
      @tictactoe.play_hand(5, "O")
      result = @tictactoe.play_hand(9, "O")
      expect(result).to eq(ai_wins)
    end

    # Test 13
    it "Player wins by drawing 3 crosses right-to-left diagonally" do
      @tictactoe.play_hand(3, "X")
      @tictactoe.play_hand(5, "X")
      result = @tictactoe.play_hand(7, "X")
      expect(result).to eq(player_wins)
    end

end
