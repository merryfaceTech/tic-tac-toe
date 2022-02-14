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

  def set_square(selected_square, symbol)
    if selected_square <= 3
      @row1[selected_square - 1] = symbol
      @rows[0] = @row1
    elsif selected_square >= 3 && selected_square <= 6
      @row2[selected_square - 1] = symbol
      @rows[1] = @row2
    else
      @row3[selected_square - 1] = symbol
      @rows[2] = @row3
    end
  end
  
  def square_checker(row_no)
    if row_no[0] == row_no[1] && row_no[1] == row_no[2]
      # puts "Game over, Player 1 wins!"
      row_no[0] == "X" ? "Game over, Player 1 wins!" : "Game over, AI wins!"
    else
      @rows
    end
  end

  def player_adds_cross(selected_square)
    set_square(selected_square, "X")
    square_checker(@row1)
  end

  def player_adds_naught(selected_square)
    set_square(selected_square, "O")
    square_checker(@row1)
  end

end