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

    def minimax(who_won_result)
      return 1 if who_won_result == "ai"
      return -1 if who_won_result == "player"
      return 0 if who_won_result == "draw" || who_won_result == "ongoing"
    end

end
