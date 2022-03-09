require_relative './Tictactoe'

class Ai
    def get_free_squares(grid)
      free_squares = []

      grid.each_with_index do |row, row_index|

          row.each_with_index do |column, column_index|
              if column == " "
                  free_squares.append(column_index + 1) if row_index == 0
                  free_squares.append(column_index + 4) if row_index == 1
                  free_squares.append(column_index + 7) if row_index == 2
              end
          end
      end

      return free_squares
    end

    def ai_chooses_box(grid)
        # === Stop player from winning via rows ===
        grid.each_with_index do |row, index|
            if index == 0
              return 1 if row[1] == "X" && row[2] == "X" && row[0] == " "
              return 2 if row[0] == "X" && row[2] == "X" && row[1] == " "
              return 3 if row[0] == "X" && row[1] == "X" && row[2] == " "
            end

            if index == 1
              return 4 if row[1] == "X" && row[2] == "X" && row[0] == " "
              return 5 if row[0] == "X" && row[2] == "X" && row[1] == " "
              return 6 if row[0] == "X" && row[1] == "X" && row[2] == " "
            end

            if index == 2
              return 7 if row[1] == "X" && row[2] == "X" && row[0] == " "
              return 8 if row[0] == "X" && row[2] == "X" && row[1] == " "
              return 9 if row[0] == "X" && row[1] == "X" && row[2] == " "
            end
        end
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

    def minimax(grid)
        return 1 if check_who_won(grid, "O") == :win
        return -1 if check_who_won(grid, "X") == :lose
        return 0 if check_who_won(grid, "O") == :draw

        scores = [[-1]]
        current_player_is_ai = true

        get_free_squares(grid).each do |square|
          possible_game = set_box(grid, square, current_player_is_ai ? "O" : "X")
          score = minimax(possible_game)[0]
          scores.append([score, square])
          current_player_is_ai = !current_player_is_ai
        end

        return scores.max if current_player_is_ai
        return scores.min if !current_player_is_ai
        

        # if is_maximizing
        #     best_score = -1000
        #     score = -1000

        #         if square <= 3
        #           grid[0][square - 1] = "O"
        #         elsif square > 3 && square <= 6
        #           grid[1][square - 4] = "O"
        #         else
        #           grid[2][square - 7] = "O"
        #         end

        #         score = minimax(grid, false)
                
        #         if square <= 3
        #           grid[0][square - 1] = " "
        #         elsif square > 3 && square <= 6
        #           grid[1][square - 4] = " "
        #         else
        #           grid[2][square - 7] = " "
        #         end
                
        #         best_score = score if score > best_score
        #     end

        # else
        #     best_score = 1000
        #     get_free_squares(grid).each do |square|
        #       if square <= 3
        #         grid[0][square - 1] = "X"
        #       elsif square > 3 && square <= 6
        #         grid[1][square - 4] = "X"
        #       else
        #         grid[2][square - 7] = "X"
        #       end

        #       score = minimax(grid, true)
              
        #       if square <= 3
        #         grid[0][square - 1] = " "
        #       elsif square > 3 && square <= 6
        #         grid[1][square - 4] = " "
        #       else
        #         grid[2][square - 7] = " "
        #       end
              
        #       best_score = score if score < best_score
        #   end
        # end

        # return best_score
    end
end
