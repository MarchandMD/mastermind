# frozen_string_literal: true

require 'colorize'

module Mastermind
  # this is the Gameboard class
  class Gameboard
    attr_accessor :solution, :guesses, :hints

    #need to pass something into it....
    def initialize(input = nil)
      @solution = input ||= Colorcode.new
      @guesses = Array.new(12, Colorcode.new('white', 'white', 'white', 'white'))
      @hints = Array.new(12, Hint.new('white', 'white', 'white', 'white'))
    end

    def display(guesses = @guesses, hints = @hints)
      puts '_____________________'
      guesses.each_with_index { |guess, index| puts "| #{colorize(guess, true)} | #{colorize(hints[index], false)} |" }
      puts '---------------------'
    end

    def refresh(row_index)
      evaluate(row_index)
      display
    end

    # this method should probably be broken into more pieces
    def evaluate(row_index)
      correct_colors = 0

      @guesses[row_index].colors.each_with_index do |color, index|
        correct_colors += 1 if @solution.colors[index] == color
      end

      @solution
      # misplaced_correct_colors = @guesses[row_index].colors.select { |color| @solution.colors.include?(color) == true }.uniq.length - correct_colors

      # colors = []

      # correct_colors.times do
      #   colors << 'green'
      # end

      # misplaced_correct_colors.times do
      #   colors << 'red'
      # end

      # colors << 'white' until colors.length == 4

      #@hints[row_index] = Hint.new(colors[0], colors[1], colors[2], colors[3])
    end

    def colorize(set, is_color_code)
      colors = []
      text = is_color_code ? 'O' : '.'
      set.colors.each { |color| colors.push(text.public_send(color.to_sym)) }
      colors.join(' ')
    end
  end
end
