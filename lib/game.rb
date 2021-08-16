# frozen_string_literal: false

require_relative 'words'
require_relative 'graphics'
require 'yaml'

# Manages game: starting, looping, ending
class Game
  MAX_GAME_TURN = 12

  def initialize(data = {})
    @word = data[:word]
    @hidden_word = data[:hidden_words]
    @guess_character = data[:guess_character]
    @wrong_turns = data[:wrong_turns]
  end

  def start
    setup_game
    show_welcome_message
    puts 'Press [ENTER] to start...'
    gets

    loop do
      print_ui
      ask_for_guess

      break if game_over
    end

    print_game_over_message
  end

  private

  def setup_game
    @wrong_turns = 0
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
      break if condition.length == 1

      puts condition
    end
    process_guess
  end

  def correct_guess
    return 'only letters allowed' unless @guess_character.match?(/[[:alpha:]]/)

    return 'too long (1 character allowed)' if @guess_character.length > 1

    return 'guess duplicated!' if @hidden_word.include? @guess_character.upcase

    @guess_character.upcase!
    @guess_character
  end

  def process_guess
    copy_hidden_word = @hidden_word.clone
    @word.split('').each_with_index do |char, index|
      next unless @guess_character.match? char

      @hidden_word[index] = char
    end

    return if @hidden_word != copy_hidden_word

    @wrong_turns += 1
  end

  def create_hidden_word
    @word.length.times do
      @hidden_word << '_'
    end
  end

  def game_over
    return :win if @hidden_word == @word
    return :lose if @wrong_turns >= MAX_GAME_TURN

    false
  end

  def print_game_over_message
    print_ui
    puts 'Game over. You won!' if game_over == :win
    puts 'Game over. You lose!' if game_over == :lose
  end

  def print_ui
    system 'clear'
    puts Graphics.print_hangman @wrong_turns
    puts
    puts @hidden_word
  end
end
