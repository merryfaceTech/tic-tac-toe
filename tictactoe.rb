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
    @row1=["", "", ""]
    @row2=["", "", ""]
    @row3=["", "", ""]
    @rows = [
      @row1,
      @row2,
      @row3
    ]
    @rows
  end

  def set_square(selected_square, symbol)
    if selected_square <= 3
      @row1[selected_square - 1] = symbol
      @rows[0] = @row1
    elsif selected_square > 3 && selected_square <= 6
      @row2[selected_square - 4] = symbol
      @rows[1] = @row2
    else
      @row3[selected_square - 7] = symbol
      @rows[2] = @row3
    end
  end

  def column_checker
    col1_is_not_empty = @row1[0] == "X" || @row1[0] == "O"
    col2_is_not_empty = @row2[1] == "X" || @row2[1] == "O" 
    col3_is_not_empty = @row3[2] == "X" || @row3[2] == "O" 
    column1_win = @row1[0] == @row2[0] && @row1[0] == @row3[0] && col1_is_not_empty
    column2_win = @row1[1] == @row2[1] && @row1[1] == @row3[1] && col2_is_not_empty
    column3_win = @row1[2] == @row2[2] && @row1[2] == @row3[2] && col3_is_not_empty
    column1_win || column2_win || column3_win
  end
  
  def game_end_checker(is_player)
    player = is_player ? "X" : "O"
    winning_row = [player, player, player]
    endgame_message = is_player ? "Game over, Player wins!" : "Game over, AI wins!"
    win_by_row = @row1 == winning_row || @row2 == winning_row || @row3 == winning_row
    win_by_column = column_checker()

    if win_by_row || win_by_column
      endgame_message
    else
      @rows
    end
  end

  def player_adds_cross(selected_square)
    set_square(selected_square, "X")
    game_end_checker(true)
  end

  def ai_adds_naught(selected_square)
    set_square(selected_square, "O")
    game_end_checker(false)
  end

end
#commit