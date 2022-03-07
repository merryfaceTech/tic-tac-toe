
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
    it "Stops player from winning by blocking its path on first row" do
        ai = Ai.new

        testing_grid = [
          ["X", "X", " "],
          [" ", "O", " "],
          [" ", " ", " "],
        ]

        result = ai.ai_chooses_box(testing_grid)

        stop_win_grid = [
            ["X", "X", "O"],
            [" ", "O", " "],
            [" ", " ", " "],
          ]
    
        expect(result).to eq(stop_win_grid)
      end
end