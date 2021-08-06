# frozen_string_literal: true

require_relative 'words'

words = Words.new('wordslist.txt')
words.randomize_word
