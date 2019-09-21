# frozen_string_literal: true

module Mastermind
  class Peg
    attr_accessor :color

    def initialize(color = '')
      @color = color
    end
  end
end
