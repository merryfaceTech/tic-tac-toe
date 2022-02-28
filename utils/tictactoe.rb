class Tictactoe
  def initialize
    @row1=[" ", " ", " "]
    @row2=[" ", " ", " "]
    @row3=[" ", " ", " "]
    @rows = [
      @row1,
      @row2,
      @row3
    ]
    @moves_played = 0
  end

  def start_new_game
    @row1=[" ", " ", " "]
    @row2=[" ", " ", " "]
    @row3=[" ", " ", " "]
    @rows = [
      @row1,
      @row2,
      @row3
    ]
    @moves_played = 0
    @rows
  end

  def set_box(selected_box, symbol)
    if selected_box <= 3
      @row1[selected_box - 1] = symbol
      @rows[0] = @row1
    elsif selected_box > 3 && selected_box <= 6
      @row2[selected_box - 4] = symbol
      @rows[1] = @row2
    else
      @row3[selected_box - 7] = symbol
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

  def diagonal_checker
    left_diagonal_win = @row1[0] == @row3[2] && @row1[0] == @row2[1]
    right_diagonal_win = @row1[2] == @row3[0] && @row1[2] == @row2[1]
    
    if @row2[1] != " "
      if left_diagonal_win || right_diagonal_win
        true
      end
    end
  end

  def row_checker()
    row1_is_not_empty = @row1[0] == "X" || @row1[0] == "O"
    row2_is_not_empty = @row2[0] == "X" || @row2[0] == "O" 
    row3_is_not_empty = @row3[0] == "X" || @row3[0] == "O"
    row1_win = @row1[0] == @row1[1] && @row1[1] == @row1[2] && row1_is_not_empty
    row2_win = @row2[0] == @row2[1] && @row2[1] == @row2[2] && row2_is_not_empty
    row3_win = @row3[0] == @row3[1] && @row1[1] == @row3[2] && row3_is_not_empty
    row1_win || row2_win || row3_win
  end

  def game_end_checker(is_player)
    win_by_row = row_checker()
    win_by_column = column_checker()
    win_by_diagonal = diagonal_checker()
    all_moves_played = @moves_played == 9
    
    win_by_row || win_by_column || win_by_diagonal || all_moves_played
  end

  def game_over(is_player)
    is_player ? "Game over, Player wins!" : "Game over, AI wins!"
  end

  def game_draw
    if !@rows.flatten.include?(" ")
      "Game over, nobody wins!"
    end
  end

  def play_hand(selected_box, symbol)
    is_player = symbol == "X"
    set_box(selected_box, symbol)
    @moves_played += 1

    if game_end_checker(is_player)
      if row_checker() || column_checker() || diagonal_checker()
        game_over(is_player)
      elsif @moves_played == 9
        game_draw()
      else
        is_player ? "It's the AI's turn" : "It's your turn."
      end
    end
  end

  def get_rows
    @rows
  end
end

