# frozen_string_literal: false

require_relative 'words'

# Manages game: starting, looping, ending
class Game
  def initialize
    @word = ''
    @hidden_word = ''
    @guess_character = ''
  end

  def start
    setup_game
    show_welcome_message
    puts @word
    ask_for_guess
    puts @hidden_word
  end

  private

  def setup_game
    words = Words.new('wordslist.txt')
    @word = words.randomize_word
    create_hidden_word
    @word.upcase!
  end

  def show_welcome_message
    puts '----------------------------------------------------------------'
    puts 'Welcome to Hangman'
    puts 'We randomize one 5 to 12 character word and you have to guess it'
    puts 'If you can guess the word before you will be hanged. You win.'
    puts 'Otherwise, you lose.'
    puts 'Guess:'
    puts '1. One character long'
    puts '2. Only letters allowed'
    puts '----------------------------------------------------------------'
  end

  def ask_for_guess
    loop do
      print 'Enter your guess: '
      @guess_character = gets.chomp

      condition = correct_guess
      return if condition.length == 1

      puts condition
    end
  end

  def correct_guess
    return 'only letters allowed' unless @guess_character.match?(/[[:alpha:]]/)

    return 'too long (1 character allowed)' if @guess_character.length > 1

    @guess_character.upcase!
    @guess_character
  end

  def create_hidden_word
    @word.length.times do
      @hidden_word << '_'
    end
  end
end
