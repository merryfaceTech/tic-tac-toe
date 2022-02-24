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
        @move_dictionary = { [1,2] => 3,
            [2,3] => 1,
            [5,6] => 4,
            [4,5] => 6,
            [8,9] => 7,
            [7,8] => 9,
            [1,4] => 7,
            [4,7] => 1,
            [2,5] => 8,
            [5,8] => 2,
            [3,6] => 9,
            [6,9] => 3,
            [1,5] => 9,
            [5,9] => 1,
            [3,5] => 7,
            [7,5] => 3,
          }
        
        if @boxes_chosen_by_player.length == 0
            selected_square = 5
        elsif @boxes_chosen_by_player.length >= 2
            @move_dictionary.each do | choices, stop_player |
                @boxes_chosen_by_player.include?(choices)
                selected_square = stop_player if selected_square != "X"
            end
        else
            selected_square = rand(1..9) if selected_square != "X"
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