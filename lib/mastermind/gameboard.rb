# frozen_string_literal: true

require "colorize"

module Mastermind
  # this is the Gameboard class
  class Gameboard
    attr_accessor :solution, :guesses, :hints

    def initialize(solution = Colorcode.new, guesses = Array.new(12, Colorcode.new("white", "white", "white", "white")))
      @solution = solution
      @guesses = guesses
      @hints = Array.new(12, Hint.new("white", "white", "white", "white"))
    end

    def display(guesses = self.guesses, hints = self.hints)
      puts "_____________________"
      guesses.each_with_index { |guess, index| puts "| #{colorize(guess, true)} | #{colorize(hints[index], false)} |" }
      puts "---------------------"
    end

    def refresh(row_index)
      evaluate(row_index)
      display
    end

    # this method should probably be broken into more pieces - Jonathan Yiv
    # wrote and called #feedback

    def evaluate(row_index)
      correct_colors = 0

      guesses[row_index].colors.each_with_index do |peg, index|
        correct_colors += 1 if solution.colors[index] == peg
      end

      misplaced_correct_colors = guesses[row_index].colors.select { |color| solution.colors.include?(color) == true }.uniq.length - correct_colors

      feedback(correct_colors, misplaced_correct_colors, row_index)
    end

    def colorize(set, is_color_code)
      colors = []
      text = is_color_code ? "O" : "*"
      set.colors.each { |color| colors.push(text.public_send(color.to_sym)) }
      colors.join(" ")
    end

    private

    def feedback(green_count, red_count, row_index)
      feedback = []
      green_count.times { feedback << "green" }
      red_count.times { feedback << "red" }
      feedback << "white" until feedback.length == 4
      hints[row_index] = Hint.new(feedback[0], feedback[1], feedback[2], feedback[3])
    end
  end
end
