
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

  # ==== MINIMAX ====

  it 'detects that it already won, sly old dog' do
    ai = Ai.new
    testing_grid = [
      ["O", " ", "O"],
      ["O", "X", "X"],
      ["O", "X", "X"],
    ]

    result = [1]
    method = ai.minimax(testing_grid)
    expect(method).to eq(result)
  end

  it 'detects that it\'s a draw' do
    ai = Ai.new
    testing_grid = [
      ["O", "X", "O"],
      ["X", "X", "O"],
      ["X", "O", "X"],
    ]

    result = [0]
    method = ai.minimax(testing_grid)
    expect(method).to eq(result)
  end

  it 'detects that it already lost, poor old dog' do
    ai = Ai.new
    testing_grid = [
      ["X", " ", "O"],
      ["O", "X", "X"],
      ["O", "O", "X"],
    ]

    result = [-1]
    method = ai.minimax(testing_grid)
    expect(method).to eq(result)
  end

  it 'blocks player from winning' do
    ai = Ai.new
    testing_grid = [
      ["O", " ", " "],
      ["X", "O", "X"],
      ["O", "X", "X"],
    ]

    result = [1, 3]
    method = ai.minimax(testing_grid)
    expect(method).to eq(result)
  end
  
  it 'blocks player and returns a drawing move' do
    ai = Ai.new
    testing_grid = [
      ["O", " ", " "],
      ["X", "X", "O"],
      ["O", "X", "X"],
    ]

    result = [0, 2]
    method = ai.minimax(testing_grid)
    expect(method).to eq(result)
  end

  it 'last move choose win instead of lose' do
    ai = Ai.new
    testing_grid = [
      ["O", "O", " "],
      ["X", "X", " "],
      ["X", " ", "O"],
    ]

    result = [1, 3]
    method = ai.minimax(testing_grid)
    expect(method).to eq(result)
  end
end
