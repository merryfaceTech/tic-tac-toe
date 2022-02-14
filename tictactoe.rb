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
    if @rows[0] == @rows[1] && @rows[1] == @rows[2]
      puts "Game over, Player 1 wins!"
      return "Game over, Player 1 wins!"
    else
      @rows
    end
  end

  def player_adds_naught(selected_square)
    @rows[selected_square - 1] = "O"
    @rows
  end

end
