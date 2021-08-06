# frozen_string_literal: true

# Is responsible for loading all words from file
# and randomly select one of these words to play game
# words - any word that is 5 - 12 characters long (without whitespaces)
class Words
  def initialize(file_path)
    @file_path = file_path
  end

  def randomize_word
    p read_words_from_file
  end

  private

  def read_words_from_file
    words = []
    file_data = File.readlines(@file_path)
    file_data.each do |word|
      clear_word = word.gsub(/\s+/, '')
      words.push(clear_word) unless clear_word.length != 5
    end
    words
  end
end
