require_relative '../utils/Game_screen'

describe Game_screen do
  game_ui = described_class.new

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
    expect{ game_ui.ai_chooses_square(5) }.to output(middle_box).to_stdout
  end

  # Test 4
  it "Player wins, displays updated grid" do
    winning_grid =
%Q(Please enter the square you would like to use!

 X | X | X 
-----------
   | O | O 
-----------
   |   |   
Game over, Player wins!
)
    allow(game_ui).to receive(:gets).and_return("2")
    game_ui.player_chooses_square
    game_ui.ai_chooses_square(6)
    allow(game_ui).to receive(:gets).and_return("3")
    expect{ game_ui.player_chooses_square }.to output(winning_grid).to_stdout
  end

  # Test 5
  it "Resets the board" do
    game_ui.reset_board
    expect(game_ui.get_rows).to eq([
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ])
    expect(game_ui.get_grid).to eq("")
    expect(game_ui.get_boxes).to eq([])
  end

end
# ====================================================================

describe Game_screen do
  game_ui = described_class.new

  it 'AI wins a game' do
    winning_grid =
%Q(
 X | X | O 
-----------
 X | O | O 
-----------
   | X | O 
Game over, AI wins!
)
    allow(game_ui).to receive(:gets).and_return("1")
    game_ui.player_chooses_square
    game_ui.ai_chooses_square(5)
    allow(game_ui).to receive(:gets).and_return("2")
    game_ui.player_chooses_square
    game_ui.ai_chooses_square(3)
    allow(game_ui).to receive(:gets).and_return("4")
    game_ui.player_chooses_square
    game_ui.ai_chooses_square(6)
    allow(game_ui).to receive(:gets).and_return("8")
    game_ui.player_chooses_square
    expect{ game_ui.ai_chooses_square(9)}.to output(winning_grid).to_stdout
  end
end