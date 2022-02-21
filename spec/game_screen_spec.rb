require_relative '../utils/Game_screen'
require_relative '../utils/TicTactoe'

describe Game_screen do
  game_ui = described_class.new
  game_logic = Tictactoe.new

  # Test 1
  it "displays the greeting and the instructional grid at round 0" do
    empty_grid = 
%Q(Hey, welcome to TIC-TAC-TOE.
 1 | 2 | 3 
-----------
 4 | 5 | 6 
-----------
 7 | 8 | 9 
)
    
    expect{ game_ui.initiate_game() }.to output(empty_grid).to_stdout
  end

  # Test 2
  it "gets player input to update top left box, displays updated grid" do
    message = "Please enter the square you would like to use!" + "\n"
    top_left_corner =
%Q(
 X |   |   
-----------
   |   |   
-----------
   |   |   
)
    allow(game_ui).to receive(:gets).and_return("1")
    expect{ game_ui.player_chooses_square }.to output(message + top_left_corner).to_stdout
  end

  # Test 3
  it "AI makes first choice, displays updated grid" do
    middle_box=
%Q(
 X |   |   
-----------
   | O |   
-----------
   |   |   
)
    allow(game_ui).to receive(:gets).and_return("1")
    expect{ game_ui.ai_chooses_square }.to output(middle_box).to_stdout
  end

  # Test 4
  it "Player wins, displays updated grid" do
    winning_grid =
%Q(Please enter the square you would like to use!

 X | X | X
-----------
   | O |   
-----------
   |   |   
Game over, Player wins!
)
    allow(game_ui).to receive(:gets).and_return("2")
    game_ui.player_chooses_square
    allow(game_ui).to receive(:gets).and_return("3")
    expect{ game_ui.player_chooses_square }.to output(winning_grid).to_stdout
  end
end