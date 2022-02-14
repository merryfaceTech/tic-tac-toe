class Tictactoe
  def initialize
    @rows = ["", "", "", "", "", "", "", "", ""]
  end

  def start_new_game
    @rows = ["", "", "", "", "", "", "", "", ""]
    @rows
  end

  def player_adds_cross(selected_square)
    @rows[selected_square - 1] = "X"
    @rows
  end
end
