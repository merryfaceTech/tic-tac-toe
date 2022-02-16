require_relative '../utils/Game_screen'
require_relative '../utils/TicTactoe'

describe Game_screen do
  game_ui = described_class.new
  game_logic = Tictactoe.new

  # Test 1
  it "displays an empty grid at round 0" do
    empty_grid = "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
    grid = game_ui.initiateGame
    expect(grid).to eq(empty_grid)
  end

  # Test 2
  it "gets player input to update top left box, displays updated grid" do
    top_left_corner = " X |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
    grid = game_ui.player_chooses_square
    expect(grid).to eq(top_left_corner)
  end
end
