
require './utils/ai'
require './utils/tictactoe'

describe Ai do
    # Test 1
    it "Retrieves all available squares" do
      ai = Ai.new

      testing_grid = [
        ["X", "X", "O"],
        [" ", "O", "O"],
        [" ", " ", "X"],
      ]

      free_squares = [4, 7, 8]

      result = ai.get_free_squares(testing_grid)

      expect(result).to eq(free_squares)
    end

    # Test 2
    it "Stops player from winning by blocking its path on rows" do
        ai = Ai.new

        testing_grid = [
          ["X", "X", " "],
          [" ", "O", " "],
          [" ", " ", " "],
        ]

        result = ai.ai_chooses_box(testing_grid)

        stop_win_move = 3
    
        expect(result).to eq(stop_win_move)
      end

      # Test 3
      it "Stops player from winning by blocking its path on columns" do
        ai = Ai.new

        testing_grid = [
          [" ", " ", " "],
          ["X", "O", " "],
          ["X", " ", " "],
        ]

        result = ai.ai_chooses_box(testing_grid)

        stop_win_move = 1
    
        expect(result).to eq(stop_win_move)
      end

      # Test 4
      it "Minimax determines if a game is ongoing or someone has won" do
          ai = Ai.new

          testing_grid = [
              ["O", " ", "X"],
              ["X", "O", " "],
              ["X", " ", "O"],
          ]

          result = ai.minimax("ongoing")
          expect(result).to eq(0)
          expect(ai.minimax("draw")).to eq(0)
          expect(ai.minimax("player")).to eq(-1)
          expect(ai.minimax("ai")).to eq(1)
      end
      
      # Test 5
      it "Minimax will choose the move to stop it from losing (diagonal)" do
        ai = Ai.new

        testing_grid = [
            [" ", " ", " "],
            ["O", "X", " "],
            ["X", " ", " "],
        ]

        result = ai.ai_chooses_box(testing_grid)

        stop_win_move = 3
    
        expect(result).to eq(stop_win_move)
    end  
      
end
