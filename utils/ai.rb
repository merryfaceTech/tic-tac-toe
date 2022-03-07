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
end