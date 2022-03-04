require_relative '../utils/Game_screen'

describe Game_screen do
  game_ui = described_class.new

  # Test 1
  it "displays the greeting and the instructional grid at round 0" do
    empty_grid = 
      "Hey, welcome to TIC-TAC-TOE." +
      " 1 | 2 | 3 \n" +
      "-----------\n" +
      " 4 | 5 | 6 \n" +
      "-----------\n" +
      " 7 | 8 | 9 "

    
    expect{ game_ui.initiate_game() }.to output(empty_grid).to_stdout
  end

  # Test 2
  it "gets player input to update top left box, displays updated grid" do
    message = "Please enter the square you would like to use!" + "\n"
    top_left_corner =
      " X |   |   \n" +
      "-----------\n" +
      "   |   |   \n" +
      "-----------\n" +
      "   |   |   "

    allow(game_ui).to receive(:gets).and_return("1")
    expect{ game_ui.player_chooses_square }.to output(message + top_left_corner).to_stdout
  end

  # Test 3
  it "AI makes first choice, displays updated grid" do
    middle_box=
      " X |   |   \n" +
      "-----------\n" +
      "   | O |   \n" +
      "-----------\n" +
      "   |   |   "

    allow(game_ui).to receive(:gets).and_return("1")
    expect{ game_ui.ai_chooses_square(5) }.to output(middle_box).to_stdout
  end

  # Test 4
  it "Player wins, displays updated grid" do
    winning_grid =
      "Please enter the square you would like to use!\n" +
      " X | X | X \n" +
      "-----------\n" +
      "   | O | O \n" +
      "-----------\n" +
      "   |   |   \n" +
      "Game over, Player wins!"

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

  # Test 6
  it "checks if all squares are full and no winner" do
    tie_grid =
      " X | O | X \n" +
      "-----------\n" +
      " X | X | O \n" +
      "-----------\n" +
      " O | X | O \n" +
      "Game over, nobody wins!"

    allow(game_ui).to receive(:gets).and_return("1")
    game_ui.player_chooses_square

    game_ui.ai_chooses_square(2)

    allow(game_ui).to receive(:gets).and_return("3")
    game_ui.player_chooses_square

    game_ui.ai_chooses_square(7)

    allow(game_ui).to receive(:gets).and_return("5")
    game_ui.player_chooses_square

    game_ui.ai_chooses_square(6)

    allow(game_ui).to receive(:gets).and_return("4")
    game_ui.player_chooses_square

    game_ui.ai_chooses_square(9)

    allow(game_ui).to receive(:gets).and_return("8")

    expect{ game_ui.player_chooses_square}.to output(tie_grid).to_stdout
  end

end
# ====================================================================

describe Game_screen do
  game_ui = described_class.new

  it 'AI wins a game' do
    winning_grid = 
      " X | X | O \n" +
      "-----------\n" +
      " X | O | O \n" +
      "-----------\n" +
      "   | X | O \n" +
      "Game over, AI wins!"

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