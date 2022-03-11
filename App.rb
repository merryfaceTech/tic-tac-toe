require "./utils/game_screen.rb"

class App

def start_the_game(game)
  game.initiate_game
end

def run
  game = game_screen.new
  start_new_game(game)
end

end

run()