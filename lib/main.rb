# frozen_string_literal: false

require_relative 'game'
game_data = {
  word: '',
  hidden_words: '',
  wrong_turns: 0
}
game = Game.new(game_data)
game.start
