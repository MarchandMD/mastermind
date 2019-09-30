# frozen_string_literal: true

module Mastermind
  # a necessary comment
  class Colorcode
    attr_accessor :colors

    def initialize(*args)
      @colors = if args.length == 4
                  [args[0], args[1], args[2], args[3]]
                else
                  color_spectrum.shuffle.pop(4)
                end
    end

    private

    def color_spectrum
      %w[red orange yellow green blue indigo violet]
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
