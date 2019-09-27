# frozen_string_literal: true

# a necessary comment
module Mastermind
  # a necessary Class; HURR DURR I'M A COMMENT, HURR DURR
  class Computer
    attr_accessor :color_spectrum, :guess_set, :correct_colors

    def initialize(guess_set = 0, correct_colors = [])
      @color_spectrum = %w[red green yellow blue black magenta cyan white]
      @guess_set = guess_set
      @correct_colors = correct_colors
    end

    # calls #get_guess with (hints, turns)and passes (hints, turns) to #color_is_correct
    # returns a collection
    def guess(hints = nil, turn = nil)
      computer_guess = get_guess(hints, turn)
      print "#{computer_guess[0]}, #{computer_guess[1]}, #{computer_guess[2]}, #{computer_guess[3]}"
      computer_guess
    end

    # accepts (hints, turns) from #guess
    #
    def get_guess(hints = nil, turn = nil)
      computer_guess = []

      if @correct_colors.uniq.length != 4
        case turn
        when 1
          4.times { computer_guess << @color_spectrum[@guess_set] }

          @guess_set += 1
        when (2..8)
          4.times { computer_guess << @color_spectrum[@guess_set] }

          @correct_colors << @color_spectrum[@guess_set - 1] if color_is_correct(hints, turn)

          @guess_set += 1 if @guess_set < 8
        when 9
          @correct_colors << @color_spectrum[@guess_set - 1] if color_is_correct(hints, turn)
          computer_guess = @correct_colors
          @correct_colors = @correct_colors.shuffle
        else
          computer_guess = @correct_colors
          @correct_colors = @correct_colors.shuffle
        end
      else
        computer_guess = @correct_colors
        @correct_colors = @correct_colors.shuffle
      end
      computer_guess
    end

    def color_is_correct(hints, turn)
      hints[12 - turn + 1].colors[0] == "green"
    end
  end
end
