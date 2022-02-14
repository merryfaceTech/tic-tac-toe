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
    elsif selected_square > 3 && selected_square <= 6
      @row2[selected_square - 4] = symbol
      @rows[1] = @row2
    else
      @row3[selected_square - 7] = symbol
      @rows[2] = @row3
    end
  end
  
  def game_end_checker(is_player)
    player = is_player ? "X" : "O"
    winning_row = [player, player, player]
    endgame_message = is_player ? "Game over, Player 1 wins!" : "Game over, AI wins!"

    if @row1 == winning_row || @row2 == winning_row || @row3 == winning_row
      endgame_message
    else
      @rows
    end
  end

  def player_adds_cross(selected_square)
    set_square(selected_square, "X")
    game_end_checker(true)
  end

  def player_adds_naught(selected_square)
    set_square(selected_square, "O")
    game_end_checker(false)
  end

end