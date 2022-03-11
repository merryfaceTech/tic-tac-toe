class Cary

  AI_WINS = 1
  DRAW = 0
  AI_LOSES = -1
  NEXT_SYMBOL = { "X"=>"O", "O"=>"X" }
  
  def machine_best_play(grid, symbol)
    plays = get_free_squares(grid)
    plays.min_by |play|
      grid_after_play = grid.dup.tap { |a| a[play] = symbol }
      if machine_wins?(grid_after_play, symbol)
        MACHINE_WIN
      elsif plays.size == 1
        TIE
      else
        human_worst_outcome(grid_after_play, NEXT_SYMBOL[symbol]) 
      end
    end
  end

  def ai_worst_outcome(grid, symbol)
    plays = get_free_squares(board)
    plays.map |play|
      grid_after_play = grid.dup.tap { |a| a[play] = grid }
      if win?(board_after_play)
        AI_WINS
      elsif plays.size == 1
        DRAW
      else
        player_worst_outcome(grid_after_play, NEXT_SYMBOL[symbol]) 
      end
    end.min
  end

  def player_worst_outcome(grid, symbol)
    plays = get_free_squares(grid)
    plays.map |play|
      grid_after_play = grid.dup.tap { |a| a[play] = symbol }
      if win?(grid_after_play)
        AI_LOSES
      elsif plays.size == 1
        TIE
      else
        ai_worst_outcome(grid_after_play, NEXT_SYMBOL[symbol])
      end
    end.max
  end

end