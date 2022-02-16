require_relative './Tictactoe'

class Game_screen
    def initialize
        @TicTactoe = Tictactoe.new
        puts @TicTactoe.start_new_game
    end

    def initiateGame
        square_values = @TicTactoe.start_new_game
        empty_grid = " #{square_values[0][0]} | #{square_values[0][1]} | #{square_values[0][2]} \n-----------\n #{square_values[1][0]} | #{square_values[1][1]} | #{square_values[1][2]} \n-----------\n #{square_values[2][0]} | #{square_values[2][1]} | #{square_values[2][2]} "
        puts @TicTactoe.start_new_game
        empty_grid
    end

    def player_chooses_square
        puts "Hey, welcome to TIC-TAC-TOE. Please enter the square you would like to use!"
        choice1 = gets.chomp.to_i
    end
end