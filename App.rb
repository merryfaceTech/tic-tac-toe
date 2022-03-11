require "./utils/game_screen"
require "./utils/ai"


def start_the_game(game)
  game.initiate_game
end

def run
  game = Game_screen.new
  ai = Ai.new
  start_the_game(game)

  while !game.get_tic.game_ended do
    game.player_chooses_square

    if !game.get_tic.game_ended
      puts "AI is choosing..." 
      sleep(1)
      game.ai_chooses_square(ai.ai_chooses_box(game.get_rows))
    end
  end
end

run()