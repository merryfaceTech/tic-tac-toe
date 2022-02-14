class Tictactoe
  def initialize
    @rows = ["", "", "", "", "", "", "", "", ""]
  end

  def start_new_game
    @rows = ["", "", "", "", "", "", "", "", ""]
    @rows
  end

  # def turn(selected_square)
  #   @rows[selected_square + 1] = "X"
  #   @rows
  # end
end
