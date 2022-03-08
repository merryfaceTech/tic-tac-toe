
require './utils/ai'
require './utils/tictactoe'

describe Ai do
  # Test 1
  it "Retrieves all available squares" do
    ai = Ai.new

    testing_grid = [
      ["X", "X", "O"],
      [" ", "O", "O"],
      [" ", " ", "X"],
    ]

    free_squares = [4, 7, 8]

    result = ai.get_free_squares(testing_grid)

    expect(result).to eq(free_squares)
  end

  # Test 2
  it "Stops player from winning by blocking its path on rows" do
    ai = Ai.new

    testing_grid = [
      ["X", "X", " "],
      [" ", "O", " "],
      [" ", " ", " "],
    ]

    result = ai.ai_chooses_box(testing_grid)

    stop_win_move = 3

    expect(result).to eq(stop_win_move)
  end

  # Test 3
  it "Stops player from winning by blocking its path on columns" do
    ai = Ai.new

    testing_grid = [
      [" ", " ", " "],
      ["X", "O", " "],
      ["X", " ", " "],
    ]

    result = ai.ai_chooses_box(testing_grid)

    stop_win_move = 1

    expect(result).to eq(stop_win_move)
  end
    
  # Test 4
  it "Minimax will choose the move to stop it from losing (diagonal)" do
    ai = Ai.new

    testing_grid = [
        [" ", " ", " "],
        ["O", "X", " "],
        ["X", " ", " "],
    ]

    result = ai.ai_chooses_box(testing_grid)

    stop_win_move = 3

    expect(result).to eq(stop_win_move)
  end

  #  ==== UNIT TESTS =====

  # MINIMAX Test 1
  it "Minimax determines if a game is ongoing or someone has won" do
    ai = Ai.new

    testing_grid = [
        ["O", " ", "X"],
        ["X", "O", " "],
        ["X", " ", "O"],
    ]

    result = ai.minimax("ongoing")
    expect(result).to eq(0)
    expect(ai.minimax("draw")).to eq(0)
    expect(ai.minimax("player")).to eq(-1)
    expect(ai.minimax("ai")).to eq(1)
  end

  # MINIMAX Test 2
  it 'has minimax return best score for AI to win' do
    ai = Ai.new

    testing_grid = [
        ["X", "O", "O"],
        ["X", "X", " "],
        [" ", "X", "O"],
    ]

    expected_score = 1
    result = ai.minimax(testing_grid, true)
    expect(result).to eq(expected_score)
  end

  # CHECK_WHO_WON Test 1 
  it 'check that the selected symbol won' do
    ai = Ai.new

    testing_grids = [
      [
        ["X", "O", "O"],
        ["X", "X", "O"],
        [" ", "X", "O"],
      ],
      [
        ["X", "O", "O"],
        ["X", "X", "X"],
        ["O", "X", "O"],
      ],
      [
        ["X", "O", "X"],
        ["O", "O", "O"],
        ["O", "X", "X"],
      ],        
      [
        ["X", "O", "X"],
        ["X", "X", "O"],
        ["O", "X", "O"],
      ],
    ]

    expect(ai.check_who_won(testing_grids[0], "O")).to eq(:win)
    expect(ai.check_who_won(testing_grids[1], "O")).to eq(:lose)
    expect(ai.check_who_won(testing_grids[1], "X")).to eq(:win)
    expect(ai.check_who_won(testing_grids[2], "O")).to eq(:win)
    expect(ai.check_who_won(testing_grids[3], "O")).to eq(:draw)
    expect(ai.check_who_won(testing_grids[3], "X")).to eq(:draw)
  end
end
