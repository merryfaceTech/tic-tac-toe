require_relative './Tictactoe'

class Game_screen
    def initialize
        @Tic = Tictactoe.new
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
        @boxes = @Tic.start_new_game
        update_grid()
        @grid
    end

    def player_chooses_square
        puts "Please enter the square you would like to use!"
        choice = gets.chomp.to_i
        @Tic.play_hand(choice, "X")
        @boxes = @Tic.get_rows     
        update_grid()
        print_grid()
        if @Tic.game_end_checker(true)
            puts @Tic.game_over(true)
        else
            if !@boxes.flatten.include?(" ")
                puts "Game over, nobody wins!"
            end
        end
    end

    def ai_chooses_square(selected_square)
        @Tic.play_hand(selected_square, "O")
        @boxes = @Tic.get_rows
        update_grid()
        print_grid()
        if @Tic.game_end_checker(false)
            puts @Tic.game_over(false)
        end
    end

    def reset_board
        @Tic.start_new_game
        @grid = ""
        @boxes = []
    end

    def get_rows
        @Tic.get_rows
    end

    def get_grid
        @grid
    end

    def get_boxes
        @boxes
    end

end

# game = Game_screen.new
# game.initiate_game
# game.player_chooses_square
# game.player_chooses_square
# game.player_chooses_square