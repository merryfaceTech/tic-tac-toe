class Tictactoe
  def initialize
    @row1=["", "", ""]
    @row2=["", "", ""]
    @row3=["", "", ""]
    @rows = [
      @row1,
      @row2,
      @row3
    ]
  end

  def start_new_game
    @rows = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
    ]
    @rows
  end

  def player_adds_cross(selected_square)
    if selected_square <= 3
      @row1[selected_square - 1] = "X"
      @rows[0] = @row1
      puts @row1
    elsif selected_square >= 3 && selected_square <= 6
      @row2[selected_square - 1] = "X"
      @rows[1] = @row2
    else
      @row3[selected_square - 1] = "X"
      @rows[2] = @row3
    end

    if @row1[0] == @row1[1] && @row1[1] == @row1[2]
      # puts "Game over, Player 1 wins!"
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