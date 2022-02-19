class Tictactoe
  def initialize
    @score_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def start_new_game
    @score_board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @score_board
  end

  def set_square(selected_square, symbol)
    @score_board[selected_square - 1] = symbol
  end

  def column_checker
    col1_is_not_empty = @score_board[0] == "X" || @score_board[0] == "O"
    col2_is_not_empty = @score_board[4] == "X" || @score_board[4] == "O" 
    col3_is_not_empty = @score_board[8] == "X" || @score_board[8] == "O" 
    column1_win = @score_board[0] == @score_board[3] && @score_board[0] == @score_board[6] && col1_is_not_empty
    column2_win = @score_board[1] == @score_board[4] && @score_board[1] == @score_board[7] && col2_is_not_empty
    column3_win = @score_board[2] == @score_board[5] && @score_board[2] == @score_board[8] && col3_is_not_empty
    column1_win || column2_win || column3_win
  end

  def diagonal_checker
    left_diagonal_win = @score_board[0] == @score_board[8] && @score_board[0] == @score_board[4]
    right_diagonal_win = @score_board[2] == @score_board[6] && @score_board[2] == @score_board[4]
    
    if @score_board[4] != " "
      if left_diagonal_win || right_diagonal_win
        true
      end
    end
  end
  
  def game_end_checker(is_player)
    player = is_player ? "X" : "O"
    endgame_message = is_player ? "Game over, Player wins!" : "Game over, AI wins!"
    win_by_row1 = (@score_board[0] == player) && (@score_board[1] == player) && (@score_board[2] == player)
    win_by_row2 = (@score_board[3] == player) && (@score_board[4] == player) && (@score_board[5] == player)
    win_by_row3 = (@score_board[6] == player) && (@score_board[7] == player) && (@score_board[8] == player)
    win_by_column = column_checker()
    win_by_diagonal = diagonal_checker()

    if win_by_row1 || win_by_row2 || win_by_row3 || win_by_column || win_by_diagonal
      endgame_message
    else
      @score_board
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

  def unbeatable_ai(selected_square)
    set_square(selected_square, "O")
    game_end_checker(false)
  end

  def get_rows
    @score_board
  end
end