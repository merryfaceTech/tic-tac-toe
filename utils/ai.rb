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

    def minimax(grid, is_maximizing)
        return 1 if who_won_result == "ai"
        return -1 if who_won_result == "player"
        return 0 if who_won_result == "draw" || who_won_result == "ongoing"

        if is_maximizing
            best_score = -infinity

            get_free_squares(grid).each do |square|
              
                if square <= 3
                  grid[0][square - 1] = "O"
                elsif square > 3 && square <= 6
                  grid[1][square - 4] = "O"
                else
                  grid[2][square - 7] = "O"
                end

                score = minimax(grid, False)
                
                if square <= 3
                  grid[0][square - 1] = " "
                elsif square > 3 && square <= 6
                  grid[1][square - 4] = " "
                else
                  grid[2][square - 7] = " "
                end
                
                if score > best_score
                  best_score = score
                end
            end
        end

        return best_score
    end
end
