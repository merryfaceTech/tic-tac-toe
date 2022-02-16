require_relative '../utils/Game_screen'

describe Game_screen do
  game = described_class.new

  # Test 1
  it "displays an empty grid at round 0" do
    empty_grid = "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
    grid = game.initiateGame
    expect(grid).to eq(empty_grid)
  end

  # Test 2
  it "gets player input to update top left box, displays updated grid" do
    top_left_corner = " X |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
    puts top_left_corner
    grid_r1 = game.round1
    expect(grid_r1).to eq(top_left_corner)  
  end
end
# empty "   "
# squares = ["   ", "   ", "   "]

# line = squares.join("|")

# player_sees=
#    | X |
# -----------      
# @row2[0] | @row2[1] | @row2[2]
# -----------   
#    |   |


#    game = [
#      ["", "", ""],
#      ["", "", ""],
#      ["", "", ""]
#    ]

#    game.each |row| do
#     row.each |square| do
#       ui_square[1] = square
#     end
#   end