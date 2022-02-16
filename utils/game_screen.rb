require_relative './Tictactoe'

class Game_screen
    def initialize
        @TicTactoe = Tictactoe.new
        @grid = ""
        @boxes = []
        @instructional_grid = " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n \n"
    end

    def update_grid(show_current_grid)
        @grid = " #{@boxes[0][0]} | #{@boxes[0][1]} | #{@boxes[0][2]} \n-----------\n #{@boxes[1][0]} | #{@boxes[1][1]} | #{@boxes[1][2]} \n-----------\n #{@boxes[2][0]} | #{@boxes[2][1]} | #{@boxes[2][2]} "
        if show_current_grid
            puts "\n \n" + @grid
        end
        @grid
    end

    def initiateGame
        puts "Hey, welcome to TIC-TAC-TOE.\n \n"
        puts @instructional_grid
        @boxes = @TicTactoe.start_new_game
        update_grid(false)
    end

    def player_chooses_square
        puts "Please enter the square you would like to use! \n \n"
        choice = gets.chomp.to_i
        @TicTactoe.player_adds_cross(choice)
        @boxes = @TicTactoe.get_rows
        update_grid(true)
    end

    def ai_chooses_square
        @TicTactoe.ai_adds_naught(5)
        @boxes = @TicTactoe.get_rows
        update_grid(true)
    end

end