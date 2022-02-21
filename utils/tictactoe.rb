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

  def game_end_checker(is_player)
    player = is_player ? "X" : "O"
    winning_row = [player, player, player]
    win_by_row = @row1 == winning_row || @row2 == winning_row || @row3 == winning_row
    win_by_column = column_checker()
    win_by_diagonal = diagonal_checker()
    
    win_by_row || win_by_column || win_by_diagonal
  end
  
  def game_over(is_player)
    is_player ? "Game over, Player wins!" : "Game over, AI wins!"
  end

  def play_hand(selected_box, symbol)
    is_player = symbol == "X"
    set_box(selected_box, symbol)

    if game_end_checker(is_player)
      game_over(is_player)
    else
      # did the player just play a hand? If so, tell them AI is playing, else tell them to play
      rows_string = @row1.join("") + "|" + @row2.join("") + "|" + @row3.join("")
      turn_message = is_player ? "It's the AI's turn." : "It's your turn."
      rows_string + "\n \n" + turn_message
    end
  end

  def get_rows
    @rows
  end
end

