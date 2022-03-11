
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

  # Test 5
  it "Only one box left" do
    ai = Ai.new

    testing_grid = [
        [" ", "O", "O"],
        ["O", "X", "X"],
        ["X", "X", "O"],
    ]

    result = ai.ai_chooses_box(testing_grid)

    win_move = 1

    expect(result).to eq(win_move)
  end

    # Test 6
    it "Only two boxes left, it's the AI's turn" do
      ai = Ai.new
  
      testing_grid = [
          [" ", "O", " "],
          ["O", "X", "X"],
          ["X", "X", "O"],
      ]
  
      result = ai.ai_chooses_box(testing_grid)
  
      next_move = 3
  
      expect(result).to eq(next_move)
    end

  #  ==== UNIT TESTS =====

  # MINIMAX Test 1
  it "returns a draw score" do
    ai = Ai.new

    testing_grid_draw = [
        ["O", "X", "X"],
        ["X", "X", " "],
        ["O", "O", "X"],
    ]

    expect(ai.minimax(testing_grid_draw)[0]).to eq(0)
  end

    it 'returns a lose score' do
    ai = Ai.new

      testing_grid_player_wins = [
        ["O", "X", "O"],
        ["X", "X", " "],
        ["X", "O", "O"],
      ] 

    result = ai.minimax(testing_grid_player_wins, [], false)
    expect(result[0]).to eq(-1)
  end

  it 'returns a win score' do
    ai = Ai.new

    testing_grid_ai_wins = [
      ["O", "O", "X"],
      ["X", " ", "X"],
      ["X", "X", "O"],
    ]

    expect(ai.minimax(testing_grid_ai_wins)[0]).to eq(1)
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
    result = ai.minimax(testing_grid)[0]
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
