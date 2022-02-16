require_relative '../utils/Tictactoe'

class Game_screen
    def initiateGame
        empty_grid = "   |   |   \n-----------\n   |   |   \n-----------\n   |   |   "
        puts empty_grid
        empty_grid
    end

    def round1
        puts "Hey, welcome to TIC-TAC-TOE. Please enter the square you would like to use!"
        choice1 = gets.chomp
        if choice1 == 1
            @row1[0] = "X"
            grid_r1 = " @row1[0]  |   |   \n-----------   |   |   \n-----------   |   |   "
        end
    end
end