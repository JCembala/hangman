# frozen_string_literal: true

# Is responsible for loading all words from file
# and randomly select one of these words to play game
# words - any word that is 5 - 12 characters long (without whitespaces)
class Words
  def initialize(file_path)
    @file_path = file_path
    @words = []
  end

  def randomize_word
    load_words_from_file if @words.empty?
    select_random_word
  end

  private

  def load_words_from_file
    @words = []
    file_data = File.readlines(@file_path)
    file_data.each do |word|
      clear_word = word.gsub(/\s+/, '')
      @words.push(clear_word) unless clear_word.length != 5
    end
  end

  def select_random_word
    return '' if @words.empty?

    len = @words.length - 1
    randomized_index = rand(len)
    word = @words[randomized_index]
    @words.delete_at(randomized_index)
    word
  end
end
