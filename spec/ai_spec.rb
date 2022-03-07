
require './utils/ai'

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
end
