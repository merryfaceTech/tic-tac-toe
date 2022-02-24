require_relative '../utils/Game_screen'
require_relative '../utils/TicTactoe'

describe Game_screen do
  game_ui = Game_screen.new
  game_logic = Tictactoe.new

  # Test 1
  it "displays message and grid with numbers at round 0" do
    empty_grid = 
%Q(This is TIC-TAC-TOE. The unbeatable one chooses first, be wise and leave or choose a box using this numbered grid.

 1 | 2 | 3 
-----------
 4 | 5 | 6 
-----------
 7 | 8 | 9 
)
    start = game_ui.initiateGame
    grid = lambda { game_ui.initiateGame }
    expect{ grid.call }.to output(empty_grid).to_stdout
  end

  # Test 2
  it "will choose to play in the winning spot if there is one" do
    winning_spot =
%Q(
 X | O | X  
-----------
 X | X | O 
-----------
 O | O | X  
)
    choose = game_ui.ai_chooses_square
    grid = lambda { game_ui.ai_chooses_square }
    expect{ grid.call }.to output(winning_spot).to_stdout
  end

#   # Test 3
#   it "AI makes first choice, displays updated grid" do
#     middle_box=
# %Q(
#  X |   |   
# -----------
#    | O |   
# -----------
#    |   |   
# )
#     ai_choice = game_ui.ai_chooses_square
#     grid = lambda { game_ui.ai_chooses_square }
#     expect{ grid.call }.to output(middle_box).to_stdout
#   end

#   # Test 4
#   it "Player wins, displays updated grid" do
#     winning_grid =
# %Q(
#  X | X | X 
# -----------
#    | O | O 
# -----------
#    |   |   
# Game over, Player wins!
# )
#     player_win_message = "Game over, Player wins!"
#     player_choice = game_ui.player_chooses_square
#     grid = lambda { game_ui.player_chooses_square }
#     expect{ grid.call }.to output(winning_grid + "\n \n " + player_win_message).to_stdout
#   end
end
