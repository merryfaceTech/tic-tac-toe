require_relative './Tictactoe'

class Ai
  def get_free_squares(grid)
    free_squares = []

    grid.each_with_index do |row, row_index|
      row.each_with_index do |square, square_index|
        if square == " "
          free_squares << square_index + 1 if row_index == 0
          free_squares << square_index + 4 if row_index == 1
          free_squares << square_index + 7 if row_index == 2
        end
      end
    end

    return free_squares
  end

  def ai_chooses_box(grid)
    minimax(grid)[1]
    # get_free_squares(grid).sample(1)[0]
  end

  def check_who_won(grid, symbol)
    winning_moves = [
    [[0,0], [0,1], [0,2]],
    [[1,0], [1,1], [1,2]],
    [[2,0], [2,1], [2,2]],
    [[0,0], [1,0], [2,0]],
    [[0,1], [1,1], [2,1]],
    [[0,2], [1,2], [2,2]],
    [[0,0], [1,1], [2,2]],
    [[0,2], [1,1], [2,0]],
    ]

    winning_moves.each do |move|
      if
      grid[move[0][0]][move[0][1]] == grid[move[1][0]][move[1][1]] && 
      grid[move[1][0]][move[1][1]] == grid[move[2][0]][move[2][1]] && 
      grid[move[1][0]][move[1][1]] == symbol
        return :win
      elsif
      grid[move[0][0]][move[0][1]] == grid[move[1][0]][move[1][1]] && 
      grid[move[1][0]][move[1][1]] == grid[move[2][0]][move[2][1]] && 
      grid[move[1][0]][move[1][1]] != symbol &&
      grid[move[1][0]][move[1][1]] != " "
        return :lose
      end
    end

    return :draw if get_free_squares(grid) == []
  end

  def set_box(grid, selected_box, symbol)
    if selected_box <= 3
      grid[0][selected_box - 1] = symbol
    elsif selected_box > 3 && selected_box <= 6
      grid[1][selected_box - 4] = symbol
    else
      grid[2][selected_box - 7] = symbol
    end

    grid
  end

  def minimax(grid, scores = [], current_player_is_ai = true)
    current_player = current_player_is_ai ? "O" : "X"
    return [1] if check_who_won(grid, current_player) == :win
    return [-1] if check_who_won(grid, current_player) == :lose
    return [0] if check_who_won(grid, current_player) == :draw

    get_free_squares(grid).each do |square|
      possible_game = set_box(grid, square, current_player)
      score = minimax(possible_game, scores, !current_player_is_ai)

      scores << [-1*score[0], square]
      set_box(grid, square, " ")
    end

    pp scores.max.to_s + "||" + scores.min.to_s
    # return scores.max if current_player_is_ai
    # return scores.min if !current_player_is_ai
    scores.max
  end
end
