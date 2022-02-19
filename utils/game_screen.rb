require_relative './Tictactoe'

class Game_screen
    def initialize
        @TicTactoe = Tictactoe.new
        @grid = ""
        @boxes = []
        @boxes_chosen_by_player = []
        @instructional_grid = " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n \n"
    end

    def update_grid
        @grid = " #{@boxes[0]} | #{@boxes[1]} | #{@boxes[2]} \n-----------\n #{@boxes[3]} | #{@boxes[4]} | #{@boxes[5]} \n-----------\n #{@boxes[6]} | #{@boxes[7]} | #{@boxes[8]} "
    end

    def print_grid
        puts "\n \n" + @grid
    end

    def initiateGame
        puts "Hey, welcome to TIC-TAC-TOE.\n \n"
        puts @instructional_grid
        @boxes = @TicTactoe.start_new_game
        update_grid()
        @grid
    end

    def player_chooses_square
        puts "Please enter the square you would like to use! \n \n"
        choice = gets.chomp.to_i
        @boxes_chosen_by_player << choice
        @TicTactoe.player_adds_cross(choice)
        end_game_message = @TicTactoe.game_end_checker(true)
        game_has_ended = @TicTactoe.game_end_checker(true).is_a?(String)
        @boxes = @TicTactoe.get_rows     
        update_grid()
        print_grid()

        if game_has_ended
            puts end_game_message
        else
            ai_chooses_square()
        end
        
    end

    def ai_chooses_square
        if @boxes_chosen_by_player.length == 1
            selected_square = rand(1..9)
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
        else @boxes_chosen_by_player.include?([8, 9])
            selected_square = 7
        end
        @TicTactoe.unbeatable_ai(selected_square)
        @boxes = @TicTactoe.get_rows
        update_grid()
        print_grid()
        @grid
    end

end