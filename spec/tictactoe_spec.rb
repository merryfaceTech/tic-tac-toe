require_relative "../utils/tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

  player_wins = "Game over, Player wins!"
  ai_wins = "Game over, AI wins!"
  draw = "Game over, nobody wins!"

# Test 1
  it "start new game with an empty board in the beginning of the game" do
    result = @tictactoe.start_new_game
    expect(result).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

# Test 2
  it "starts a new game and player adds X to top left corner" do
    @tictactoe.play_hand(1, "X")
    message = @tictactoe.message("X")
    expect(message).to eq("It's the AI's turn.")
    expect(@tictactoe.get_rows).to eq([
      ["X", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ])
  end

  # Test 3
  it "starts a new game and ai adds naught to top left corner" do
    @tictactoe.play_hand(1, "O")
    message = @tictactoe.message("O")
    expect(message).to eq("It's your turn.")
    expect(@tictactoe.get_rows).to eq([
      ["O", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ])
  end

  # Test 4
  it "Player wins by drawing 3 crosses in top row" do
    @tictactoe.play_hand(1, "X")
    @tictactoe.play_hand(2, "X")
    @tictactoe.play_hand(3, "X")
    message = @tictactoe.message("X")
    expect(message).to eq(player_wins)
  end

  # Test 5
  it "AI wins by drawing 3 naughts in top row" do
    @tictactoe.play_hand(1, "O")
    @tictactoe.play_hand(2, "O")
    @tictactoe.play_hand(3, "O")
    message = @tictactoe.message("O")
    expect(message).to eq(ai_wins)
  end

  # Test 6
  it "Both players add to the grid XOX" do
    @tictactoe.play_hand(1, "X")
    @tictactoe.play_hand(2, "O")
    @tictactoe.play_hand(3, "X")
    message = @tictactoe.message("X")
    expect(message).to eq("It's the AI's turn.")
    expect(@tictactoe.get_rows).to eq([
      ["X", "O", "X"],
      [" ", " ", " "],
      [" ", " ", " "]
    ])
  end

  # Test 7
  it "starts a new game and player adds X to the middle square" do
    @tictactoe.play_hand(5, "X")
    message = @tictactoe.message("X")
    expect(message).to eq("It's the AI's turn.")
    expect(@tictactoe.get_rows).to eq([
      [" ", " ", " "],
      [" ", "X", " "],
      [" ", " ", " "]
    ])
  end

  # Test 8
  it "AI wins by drawing 3 naughts in last row" do
    @tictactoe.play_hand(7, "O")
    @tictactoe.play_hand(8, "O")
    @tictactoe.play_hand(9, "O")
    message = @tictactoe.message("O")
    expect(message).to eq(ai_wins)
  end

  # Test 9
  it "Player wins by drawing 3 crosses in the left column" do
    @tictactoe.play_hand(1, "X")
    @tictactoe.play_hand(4, "X")
    result = @tictactoe.play_hand(7, "X")
    message = @tictactoe.message("X")
    expect(message).to eq(player_wins)
  end

    # Test 10
    it "AI wins by drawing 3 naughts in the middle column" do
      @tictactoe.play_hand(2, "O")
      @tictactoe.play_hand(5, "O")
      @tictactoe.play_hand(8, "O")
      message = @tictactoe.message("O")
      expect(message).to eq(ai_wins)
    end

    # Test 11
    it "AI wins by drawing 3 naughts in the last column" do
      @tictactoe.play_hand(3, "O")
      @tictactoe.play_hand(6, "O")
      @tictactoe.play_hand(9, "O")
      message = @tictactoe.message("O")
      expect(message).to eq(ai_wins)
    end

    # Test 12
    it "AI wins by drawing 3 naughts left-to-right diagonally" do
      @tictactoe.play_hand(1, "O")
      @tictactoe.play_hand(5, "O")
      @tictactoe.play_hand(9, "O")
      message = @tictactoe.message("O")
      expect(message).to eq(ai_wins)
    end

    # Test 13
    it "Player wins by drawing 3 crosses right-to-left diagonally" do
      @tictactoe.play_hand(3, "X")
      @tictactoe.play_hand(5, "X")
      @tictactoe.play_hand(7, "X")
      message = @tictactoe.message("X")
      expect(message).to eq(player_wins)
    end

    # Test 14
    it "Determines that player won" do
      result = @tictactoe.who_won(player_wins)
      expect(result).to eq("player")
    end

    # Test 15
    it "Determines that ai won" do
      result = @tictactoe.who_won(ai_wins)
      expect(result).to eq("ai")
    end
    
    # Test 16
    it "Determines that it's a draw" do
      result = @tictactoe.who_won(draw)
      expect(result).to eq("draw")
    end    
    
    # Test 17
    it "Determines that game is ongoing" do
      result = @tictactoe.who_won("It's your turn.")
      result2 = @tictactoe.who_won("It's the AI's turn.")
      expect(result).to eq("ongoing")
      expect(result2).to eq("ongoing")
    end
end
