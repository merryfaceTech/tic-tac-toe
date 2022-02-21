require_relative './Tictactoe'

class Game_screen
    def initialize
        @TicTactoe = Tictactoe.new
        @grid = ""
        @boxes = []
        @instructional_grid =
%Q( 1 | 2 | 3 
-----------
 4 | 5 | 6 
-----------
 7 | 8 | 9 
)
    end

    def update_grid
        @grid = 
%Q( #{@boxes[0][0]} | #{@boxes[0][1]} | #{@boxes[0][2]} 
-----------
 #{@boxes[1][0]} | #{@boxes[1][1]} | #{@boxes[1][2]} 
-----------
 #{@boxes[2][0]} | #{@boxes[2][1]} | #{@boxes[2][2]} 
)

    end

    def print_grid
        puts "\n" + @grid
    end

    def initiateGame
        puts "Hey, welcome to TIC-TAC-TOE."
        puts @instructional_grid
        @boxes = @TicTactoe.start_new_game
        update_grid()
        @grid
    end

    def player_chooses_square
        puts "Please enter the square you would like to use!"
        choice = gets.chomp.to_i
        @TicTactoe.play_hand(choice, "X")
        @boxes = @TicTactoe.get_rows     
        update_grid()
        print_grid()
    end

    def ai_chooses_square
        @TicTactoe.play_hand(5, "O")
        @boxes = @TicTactoe.get_rows
        update_grid()
        print_grid()
        @grid
    end

end