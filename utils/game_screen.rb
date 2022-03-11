require_relative './Tictactoe'

class Game_screen
    def initialize
        @Tic = Tictactoe.new
        @grid = ""
        @boxes = []
        @instructional_grid =
            " 1 | 2 | 3 \n" +
            "-----------\n" +
            " 4 | 5 | 6 \n" +
            "-----------\n" +
            " 7 | 8 | 9 "
    end

    def update_grid
        @grid = 
            " #{@boxes[0][0]} | #{@boxes[0][1]} | #{@boxes[0][2]} \n" +
            "-----------\n" +
            " #{@boxes[1][0]} | #{@boxes[1][1]} | #{@boxes[1][2]} \n" +
            "-----------\n" +
            " #{@boxes[2][0]} | #{@boxes[2][1]} | #{@boxes[2][2]} "
    end

    def print_grid
        puts @grid
    end

    def initiate_game
        puts "Hey, welcome to TIC-TAC-TOE.\n"
        puts @instructional_grid
        @Tic.start_new_game
        @boxes = @Tic.get_rows()
        update_grid()
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

    def player_chooses_square
        choice = gets.chomp.to_i
        @Tic.play_hand(choice, "X")
        @boxes = @Tic.get_rows     
        update_grid()
        print_grid()
        puts @Tic.message("X")
    end

    def ai_chooses_square(selected_square)
        @Tic.play_hand(selected_square, "O")
        @boxes = @Tic.get_rows
        update_grid()
        print_grid()
        puts @Tic.message("O")
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