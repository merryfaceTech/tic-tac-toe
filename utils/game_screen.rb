require_relative './Tictactoe'

class Game_screen
    def initialize
        @TicTactoe = Tictactoe.new
        @grid = ""
        @boxes = []
        @boxes_chosen_by_player = []
        @instructional_grid =
%Q( 1 | 2 | 3 
-----------
 4 | 5 | 6 
-----------
 7 | 8 | 9 )
    end

    def update_grid
        @grid = " #{@boxes[0]} | #{@boxes[1]} | #{@boxes[2]} \n-----------\n #{@boxes[3]} | #{@boxes[4]} | #{@boxes[5]} \n-----------\n #{@boxes[6]} | #{@boxes[7]} | #{@boxes[8]} "
    end

    def print_grid
        puts "\n \n" + @grid
    end

    def initiateGame
        puts "This is TIC-TAC-TOE. The unbeatable one chooses first, be wise and leave or choose a box using this numbered grid.\n\n"
        puts @instructional_grid
        @boxes = @TicTactoe.start_new_game
        update_grid()
        @grid
    end
        
    def ai_chooses_square
        if @boxes_chosen_by_player.length == 0
            selected_square = 5
        elsif @boxes_chosen_by_player.include?([1, 2])
            selected_square = 3
        elsif @boxes_chosen_by_player.include?([2, 3])
            selected_square = 1
        elsif @boxes_chosen_by_player.include?([4, 5])
            selected_square = 6
        elsif @boxes_chosen_by_player.include?([5, 6])
            selected_square = 4
        elsif @boxes_chosen_by_player.include?([7, 8])
            selected_square = 9
        elsif @boxes_chosen_by_player.include?([8, 9])
            selected_square = 7
        else selected_square = rand(1..9)
        end
        @TicTactoe.unbeatable_ai(selected_square)
        @boxes = @TicTactoe.get_rows
        update_grid()
        print_grid()
        @grid
        end_game_message = @TicTactoe.game_end_checker(false)
        game_has_ended = @TicTactoe.game_end_checker(false).is_a?(String)
        if game_has_ended
            puts end_game_message
            exit 
        else
            player_chooses_square()
        end  
    end
    
    def player_chooses_square
        # puts "Please enter the square you would like to use! \n\n"
        choice = gets.chomp.to_i
        @boxes_chosen_by_player << choice
        @TicTactoe.player_adds_cross(choice)
        @boxes = @TicTactoe.get_rows     
        update_grid()
        print_grid()
        ai_chooses_square()
    end
        
end