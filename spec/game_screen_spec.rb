require_relative '../utils/Game_screen'
require_relative '../utils/TicTactoe'

describe Game_screen do
  game_ui = Game_screen.new
  game_logic = Tictactoe.new

  # Test 1
  it "displays message and grid with numbers at round 0" do
    empty_grid = "Hey, welcome to TIC-TAC-TOE." + "\n \n" + " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n \n"
    start = game_ui.initiateGame
    grid = lambda { game_ui.initiateGame }
    expect{ grid.call }.to output(empty_grid).to_stdout
  end

  # Test 2
  it "gets player input to update top left box, displays updated grid" do
    top_left_corner = " X |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
    choose = game_ui.player_chooses_square
    grid = lambda { game_ui.player_chooses_square }
    expect{ grid.call }.to output(top_left_corner).to_stdout
  end

  # Test 3
  it "AI makes first choice, displays updated grid" do
    middle_box = "\n \n" + " X |   |   \n-----------\n   | O |   \n-----------\n   |   |   \n"
    ai_choice = game_ui.ai_chooses_square
    grid = lambda { game_ui.ai_chooses_square }
    expect{ grid.call }.to output(middle_box).to_stdout
  end

  # Test 4
  it "Player wins, displays updated grid" do
    winning_grid = " X | X | X \n-----------\n   | O |   \n-----------\n   |   |   "
    player_win_message = "Game over, Player wins!"
    player_choice = game_ui.player_chooses_square
    grid = lambda { game_ui.player_chooses_square }
    expect{ grid.call }.to output(winning_grid + "\n \n " + player_win_message).to_stdout
  end
end
