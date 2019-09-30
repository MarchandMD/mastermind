# frozen_string_literal: true

module Mastermind
  # a necessary comment
  class Colorcode
    attr_accessor :colors

    def initialize(*args)
      @colors = make_code(args)
    end

    private

    def color_spectrum
      %w[red green yellow blue black magenta cyan white]
    end

    def make_code(arr)
      if arr.length == 4
        [arr[0], arr[1], arr[2], arr[3]]
      else
        color_spectrum.shuffle.pop(4)
      end
    end

    # attr_accessor :colors, :selected_colors

    # def initialize(color1 = random, color2 = random, color3 = random, color4 = random)
    #   @colors = [color1, color2, color3, color4]
    # end

    # def random
    #   color_spectrum = %w[red green yellow blue black magenta cyan white]
    #   random = color_spectrum.sample
    #   @selected_colors ||= []
    #   random = color_spectrum.sample while @selected_colors.include?(random)
    #   @selected_colors << random
    #   random
    # end
  end
end
