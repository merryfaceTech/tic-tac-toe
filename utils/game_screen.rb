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

    def initiate_game
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
        if @TicTactoe.game_end_checker(true)
            puts @TicTactoe.game_over(true)
        end
    end

    def ai_chooses_square(selected_square)
        @TicTactoe.play_hand(selected_square, "O")
        @boxes = @TicTactoe.get_rows
        update_grid()
        print_grid()
        if @TicTactoe.game_end_checker(false)
            puts @TicTactoe.game_over(false)
        end
    end

end

# game = Game_screen.new
# game.initiate_game
# game.player_chooses_square
# game.player_chooses_square
# game.player_chooses_square