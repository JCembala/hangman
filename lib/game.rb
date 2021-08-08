# frozen_string_literal: true

require_relative 'words'

# Manages game: starting, looping, ending
class Game
  def initialize
    @word = ''
    @guess = ''
  end

  def start
    setup_game
    show_welcome_message
    ask_for_guess
    @guess
  end

  private

  def setup_game
    words = Words.new('wordslist.txt')
    @word = words.randomize_word
  end

  def show_welcome_message
    puts '----------------------------------------------------------------'
    puts 'Welcome to Hangman'
    puts 'We randomize one 5 to 12 character word and you have to guess it'
    puts 'If you can guess the word before you will be hanged. You win.'
    puts 'Otherwise, you lose.'
    puts '----------------------------------------------------------------'
  end

  def ask_for_guess
    print 'Your guess letter is: '
    @guess = gets.chomp
  end
end
